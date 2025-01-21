package org.fp.ibaweb.restcontroller;

import org.fp.ibaweb.Model.Role;
import org.fp.ibaweb.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/")
public class RoleController {

    @Autowired
    RoleService roleService;

    @PostMapping("role")
    public ResponseEntity<Role> post(@RequestBody Role role){
        return roleService.post(role);
    }
}
