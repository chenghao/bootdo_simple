package com.bootdo.common.utils;

import com.bootdo.system.domain.UserDO;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

public class Tools {
    /**
     * 获取java对象所有字段
     * @param clazz
     * @return
     */
    public static List<String> getFields (Class<?> clazz) {
        List<String> list = new ArrayList<>();
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            list.add(field.getName());
        }
        return list;
    }

    /**
     * 判断是否有存在的字段
     * @param clazz
     * @param field
     * @return
     */
    public static boolean isExist(Class<?> clazz, String field){
        List<String> list = getFields(clazz);
        if(list.contains(field)){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 判断是否是管理员
     * @return
     */
    public static boolean isAdmin(){
        UserDO userDO = ShiroUtils.getUser();
        if("admin".equalsIgnoreCase(userDO.getUsername())){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 判断是不是超级权限（包含是不是管理员）
     * @return
     */
    public static boolean isSuperRole(){
        Long roleId = 1L; //超级管理员权限ID
        UserDO userDO = ShiroUtils.getUser();
        if(isAdmin() || userDO.getRoleIds().contains(roleId)){
            return true;
        }else{
            return false;
        }
    }

}
