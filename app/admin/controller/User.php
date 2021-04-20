<?php


namespace app\admin\controller;


use app\admin\BaseController;
use think\facade\Session;
use think\facade\View;


//前端通过axios_post传一个json对象到后端，后端用input函数接收，并不是接收前端input标签中的信息！


class User extends BaseController
{
    public function login()
    {

        //       if($uid == null || $uid == "" || $uid == "null"){
//            return $uid;
//            return View::fetch('login');
        //       }

        if (!input("user_account"))
        {
            return jerr('请确认帐号是否正确填写', 400);
        }
        if (!input("user_password"))
        {
            return jerr('请确认密码是否正确填写', 400);
        }
// 另一种接收方式
//        $params=json_decode(file_get_contents("php://input"),true);
//        $username=$params['user_account'];
//        return jerr($username);
        $user_account = input("user_account");
        $user_password = input("user_password");
        $user = new \app\model\User;
        $temp = $user->login($user_account,$user_password);

//        return jerr('执行完毕model查询'.$temp);     //测试
        if($temp)
        {
            $data = $user->getmyvalue($user_account);
            if($data['group'] == "admin"||$data['group'] == "superadmin"){
                setCookie('username', $user_account, time() + 3600, '/');
                return jok('登录成功',$temp);
            }
            else{
                return jerr('您不是管理员用户！',400);
            }
        }
        else
        {
            return jerr('用户名或密码错误',400);
        }
    }

    public function changepswd()
    {
        $oldpswd = input("oldPassword");
        $newpswd = input("newPassword");
        $user = new \app\model\User();
        $temp = $user->changepswd(cookie('username'),$oldpswd,$newpswd);
        if($temp)
        {
            setCookie('username',null, time() + 3600, '/');
            return jok('修改成功',$temp);
        }
        else
        {
            return jerr('修改失败！',400);
        }
    }

    public function logout()
    {
        $user = new \app\model\User();
        $user->logout(cookie('username'));
        setCookie('username',null, time() + 3600, '/');
        return jok('退出成功');
    }

    public function getmyvalue(){
        $user = new \app\model\User();
        $data = $user->getmyvalue(cookie('username'));
        return jok('',$data);
    }

    public function getalluser(){
        $user = new \app\model\User();
        $data = $user->getalluser();
        return jok('',$data);

    }

    public function getdata(){
        $pk = input("pk");
        $user = new \app\model\User();
        $data = $user->getmyvaluebypk($pk);
        return jok('',$data);
    }

    public function updateuser(){
        $params=json_decode(file_get_contents("php://input"),true);
        $uid = $params['uid'];
        $name = $params['name'];
        $group = $params['group'];
        $user = new \app\model\User();
        $user->updateuser($uid,$name,$group);
        return jok('修改成功！');
    }
}