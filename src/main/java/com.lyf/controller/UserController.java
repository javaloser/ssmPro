package com.lyf.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lyf.domain.User;
import com.lyf.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;

    @RequestMapping("/showUser.do")
    public void selectUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        long userId = Long.parseLong(request.getParameter("id"));
        User user = this.userService.selectUser(userId);
        ObjectMapper mapper = new ObjectMapper();
        response.getWriter().write(mapper.writeValueAsString(user));
        response.getWriter().close();
    }

    @RequestMapping("/users")
    public String list(Map<String,Object> map){
        map.put("users",userService.findAll());
        return "list";
    }

    @RequestMapping(value = "/crud",method = RequestMethod.GET)
    public String toAdd(Map<String,Object> map){
        map.put("user",new User());
        return "input";
    }

    @RequestMapping(value = "/crud",method = RequestMethod.POST)
    public String save(User user){
        userService.save(user);
        return "redirect:/user/users";
    }

    @RequestMapping(value = "/crud/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Integer id){
        userService.delete(id);
        return "redirect:/user/users";
    }

    @RequestMapping(value = "/crud/{id}", method = RequestMethod.GET)
    public String get(@PathVariable("id") Integer id, Map<String,Object> map){
        map.put("user", userService.findById(id));
        return "input";
    }

    @RequestMapping(value = "/crud", method = RequestMethod.PUT)
    public String update(User user) {
        userService.update(user);
        return "redirect:/user/users";
    }

}
