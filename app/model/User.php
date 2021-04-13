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
//            return $password;
            if ($password != $md5) {
                return false;
            }
            return $user->toArray() ?? false;
        } else {
            return false;
        }
    }

}