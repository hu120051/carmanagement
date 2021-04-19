<?php
namespace app\model;

use think\Model;

class User extends Model
{
    protected $pk = 'uid';


    public function login($user_account, $user_password)
    {
        $user = $this->where([
            "username" => $user_account,
        ])->find();
        if ($user) {
            //判断密码是否正确
            $password = MD5($user_password);
            $md5 = $user['password'];
//            return $md5;
            if ($password != $md5) {
                return false;
            }
            return $user->toArray();
        } else {
            return false;
        }
    }
    public function changepswd($username, $oldpswd, $newpswd)
    {
        $user = $this->where([
            "username" => $username,
        ])->find();
        if ($user) {
            //判断密码是否正确
            $password = MD5($oldpswd);
            $md5 = $user['password'];
    //            return $md5;
            if ($password != $md5) {
                return false;
            }
            $new = MD5($newpswd);
            $this->where([
                "username" => $username
            ])->update([
                "password" => $new,
            ]);
            return $user;
        } else {
            return false;
        }
    }
    public function getmyvalue($username)
    {
        $user = $this->where([
            "username" => $username,
        ])->find()->toArray();
        return $user;
    }
}