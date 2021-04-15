<?php


namespace app\admin\controller;


use app\admin\BaseController;
use think\facade\Session;
use think\facade\View;


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
        $user_account = input("user_account");
        $user_password = input("user_password");
        $user = new \app\model\User;
        $temp = $user->login($user_account,$user_password);

//        return jerr('执行完毕model查询'.$temp);     //测试
        if($temp)
        {

            setCookie('username', $user_account, time() + 3600, '/');
 //           return jerr('aaa'.$temp['username']);
            return jok('登录成功',$temp);
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
            return jok('修改成功',$temp);
        }
        else
        {
            return jerr('修改失败！',400);
        }
    }

    public function logout()
    {
        setCookie('username',null, time() + 3600, '/');
        return jok('退出成功');
    }
}