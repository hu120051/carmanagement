<?php
namespace app\staff\controller;

use app\staff\BaseController;
use think\facade\View;



class Index extends BaseController
{
    /**
     *
     * @return string
     */
    public function index()
    {

        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('staff');
    }
}