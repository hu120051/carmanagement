<?php
namespace app\admin\controller;

use app\admin\BaseController;
use think\facade\Session;
use think\facade\View;



class Index extends BaseController
{
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

}
