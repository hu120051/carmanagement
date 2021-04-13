<?php
namespace app\admin\controller;

use app\BaseController;
use think\facade\View;


class index extends BaseController
{
    public function index()
    {
        $uid = session('user');
        if(!isset($uid)){
            $uid = "";
        }
        if($uid == null || $uid == "" || $uid == "null" || $uid == 0){
            return View::fetch('login');
        }

    }

}
