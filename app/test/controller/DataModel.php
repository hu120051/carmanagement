<?php


namespace app\test\controller;


use app\model\User;
use think\facade\Db;


class DataModel
{
    public function index(){
//        $user = User::select();
//        dump($user);
//        return json($user);
        return json(User::find('2'));

    }
    public function insert(){
        $user = new User();
//        $user->replace()->save([
//            'name'          =>  '杨肇谦',
//            'username'      =>  'yangzhaoqian',
//            'password'      =>  'a63ee944347161d3f3b55a3e0320e3aa',
//            'group'         =>  'staff'
//        ]);
//    }
        $user->save([
            'name'          =>  '杨肇谦',
            'username'      =>  'yangzhaoqian',
            'password'      =>  'a63ee944347161d3f3b55a3e0320e3aa',
            'group'         =>  'staff'
        ]);
    }
}