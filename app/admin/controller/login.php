<?php


namespace app\admin\controller;



use app\admin\BaseController;
use think\facade\View;

class login extends BaseController
{
    public function index(){
        return View::fetch('index/login');
    }
}