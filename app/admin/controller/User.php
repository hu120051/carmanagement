<?php


namespace app\admin\controller;


use app\BaseController;
use think\facade\Session;


class User extends BaseController
{
    public function login()
    {
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
        $user->login($user_account,$user_password);

        return jerr('执行完毕model查询');     //测试
        if($user)
        {
            Session::set('user', $user_account);
            return jok('登录成功', ['access_token' => $access['access_token']]);
        }
        else
            {
                return jerr('用户名或密码错误',400);
            }
    }
}