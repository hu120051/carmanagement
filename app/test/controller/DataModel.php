<?php


namespace app\test\controller;


use app\model\User;

class DataModel
{
    public function index(){
//        $user = User::select();
//        dump($user);
//        return json($user);
        return json(User::find('2'));

    }
}