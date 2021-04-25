<?php
namespace app\staff\controller;

use app\model\Application;
use app\model\User;
use app\staff\BaseController;
use think\facade\View;

class Worker extends BaseController
{
    public function login(){
        if (!input("username"))
        {
            return jerr('请确认帐号是否正确填写', 400);
        }
        if (!input("password"))
        {
            return jerr('请确认密码是否正确填写', 400);
        }
        $username = input("username");
        $password = input("password");
        $user = new User;
        $result = $user->login($username,$password);

        if($result)
        {
            setCookie('username', $username, time() + 3600, '/');
            return jok('登录成功',$result);

        }
        else
        {
            return jerr('用户名或密码错误',400);
        }
    }

    public function getmyapplication(){
        $username = cookie('username');
        $application = new Application();
        $data = $application->getmyapplication($username);
        return jok('',$data);
    }
}