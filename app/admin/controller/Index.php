<?php
namespace app\admin\controller;

use app\admin\BaseController;
use think\facade\View;



class Index extends BaseController
{
    /**
     *
     * @return string
     */
    public function index()
    {
  //      Session::set('user', '$user_account');
 //       return session('user');
 //       $uid = session('user');
//        if(!isset($uid)){
//            $uid = "";
//        }
        $error = $this->access();
 //       if($uid == null || $uid == "" || $uid == "null"){
//            return $uid;
//            return View::fetch('login');
 //       }
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('admin');
    }

    /**
     * 修改密码
     *
     * @return string
     */
    public function changepswd()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('changepswd');
    }

    /**
     * 成员信息
     *
     * @return string
     */
    public function userinfo()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('userinfo');
    }

    /**
     * 车辆监控
     *
     * @return string
     */
    public function location()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('location');
    }
}
