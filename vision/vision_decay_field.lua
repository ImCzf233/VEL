local function a(b,c,d,...)if not b then error(string.format(d,...),c)end end;local e={rage={"aimbot","other"},aa={"anti-aimbot angles","fake lag","other"},legit={"weapon type","aimbot","triggerbot","other"},visuals={"player esp","other esp","colored models","effects"},misc={"miscellaneous","settings","lua","other"},skins={"weapon skin","knife options","glove options"},config={"presets","lua"},players={"players","adjustments"},lua={"a","b"}}for f,g in pairs(e)do e[f]={}for h=1,#g do e[f][g[h]]=true end end;local i={}local j={__index=i}function j.__call(k,...)local l={...}if#l==0 then return k:get()end;local m={pcall(k.set,k,unpack(l))}a(m[1],4,m[2])return k end;function i.new(n,f,o,p,...)local q;local r=false;if type(n)=="function"then local s={pcall(n,f,o,p,...)}a(s[1],4,"Cannot create menu item because: %s",s[2])q=s[2]else q=n;r=true end;return setmetatable({tab=f,container=o,name=p,reference=q,visible=true,hidden_value=nil,children={},ui_callback=nil,callbacks={},is_menu_reference=r,getter={callback=nil,data=nil},setter={callback=nil,data=nil},parent_value_or_callback=nil},j)end;function i:set_hidden_value(t)self.hidden_value=t end;function i:set(...)local l={...}if self.setter.callback~=nil then l=self.setter.callback(unpack(l))end;local m={pcall(ui.set,self.reference,unpack(l))}a(m[1],3,"Cannot set values of menu item because: %s",m[2])end;function i:get()if self.visible==false and self.hidden_value~=nil then return self.hidden_value end;local u={ui.get(self.reference)}if self.getter.callback~=nil then return self.getter.callback(u)end;return unpack(u)end;function i:set_setter_callback(v,w)a(type(v)=="function",3,"Cannot set menu item setter callback: argument must be a function.")self.setter.callback=v;self.setter.data=w end;function i:set_getter_callback(v,w)a(type(v)=="function",3,"Cannot set menu item getter callback: argument must be a function.")self.getter.callback=v;self.getter.data=w end;function i:add_children(x,y)if y==nil then y=true end;if getmetatable(x)==j then x={x}end;for z,A in pairs(x)do a(getmetatable(A)==j,3,"Cannot add child to menu item: children must be menu item objects. Make sure you are not trying to parent a UI reference.")a(A.reference~=self.reference,3,"Cannot parent a menu item to iself.")A.parent_value_or_callback=y;self.children[A.reference]=A end;i._process_callbacks(self)end;function i:add_callback(v)a(self.is_menu_reference==false,3,"Cannot add callbacks to built-in menu items.")a(type(v)=="function",3,"Callbacks for menu items must be functions.")table.insert(self.callbacks,v)i._process_callbacks(self)end;function i._process_callbacks(k)local v=function()for z,A in pairs(k.children)do local B;if type(A.parent_value_or_callback)=="function"then B=A.parent_value_or_callback()else B=k:get()==A.parent_value_or_callback end;local C=B==true and k.visible==true;A.visible=C;ui.set_visible(A.reference,C)if A.ui_callback~=nil then A.ui_callback()end end;for h=1,#k.callbacks do k.callbacks[h]()end end;ui.set_callback(k.reference,v)k.ui_callback=v;v()end;local D={}local E={__index=D}function D.new(f,o)D._validate_tab_container(f,o)return setmetatable({tab=f,container=o,children={}},E)end;function D:save_to_db()local F=string.format("%s_%s",self.tab,self.container)for z,k in pairs(self.children)do local G=string.format("%s_%s",F,k.name)local w={k()}database.write(G,w)end end;function D:load_from_db()local F=string.format("%s_%s",self.tab,self.container)for z,k in pairs(self.children)do local G=string.format("%s_%s",F,k.name)local w=database.read(G)if w~=nil then k(unpack(w))end end end;function D:parent_all_to(k,y)local x=self.children;x[k.reference]=nil;k:add_children(x,y)end;function D.reference(f,o,p)D._validate_tab_container(f,o)local H={pcall(ui.reference,f,o,p)}a(H[1],3,"Cannot reference Gamesense menu item because: %s",H[2])local I={select(2,unpack(H))}local J={}for h=1,#I do table.insert(J,i.new(I[h],f,o,p))end;return unpack(J)end;function D:checkbox(p)return self:_create_item(ui.new_checkbox,p)end;function D:slider(p,K,L,M,N,O,P,Q)if type(M)=="table"then local R=M;M=R.default;N=R.show_tooltip;O=R.unit;P=R.scale;Q=R.tooltips end;M=M or nil;N=N or true;O=O or nil;P=P or 1;Q=Q or nil;a(type(K)=="number",3,"Slider min value must be a number.")a(type(L)=="number",3,"Slider max value must be a number.")a(K<L,3,"Slider min value must be below the max value.")if M~=nil then a(M>=K and M<=L,3,"Slider default must be between min and max values.")end;return self:_create_item(ui.new_slider,p,K,L,M,N,O,P,Q)end;function D:combobox(p,...)local l={...}if type(l[1])=="table"then l=l[1]end;return self:_create_item(ui.new_combobox,p,l)end;function D:multiselect(p,...)local l={...}if type(l[1])=="table"then l=l[1]end;return self:_create_item(ui.new_multiselect,p,l)end;function D:hotkey(p,S)if S==nil then S=false end;a(type(S)=="boolean",3,"Hotkey inline argument must be a boolean.")return self:_create_item(ui.new_hotkey,p,S)end;function D:button(p,v)a(type(v)=="function",3,"Cannot set button callback because the callback argument must be a function.")return self:_create_item(ui.new_button,p,v)end;function D:color_picker(p,T,U,V,W)T=T or 255;U=U or 255;V=V or 255;W=W or 255;a(type(T)=="number"and T>=0 and T<=255,3,"Cannot set color picker red channel value. It must be between 0 and 255.")a(type(U)=="number"and U>=0 and U<=255,3,"Cannot set color picker green channel value. It must be between 0 and 255.")a(type(V)=="number"and V>=0 and V<=255,3,"Cannot set color picker blue channel value. It must be between 0 and 255.")a(type(W)=="number"and W>=0 and W<=255,3,"Cannot set color picker alpha channel value. It must be between 0 and 255.")return self:_create_item(ui.new_color_picker,p,T,U,V,W)end;function D:textbox(p)return self:_create_item(ui.new_textbox,p)end;function D:listbox(p,...)local l={...}if type(l[1])=="table"then l=l[1]end;local k=self:_create_item(ui.new_listbox,p,l)k:set_getter_callback(function(u)return k.getter.data[u+1]end,l)return k end;function D:label(p)a(type(p)=="string","Label name must be a string.")return self:_create_item(ui.new_label,p)end;function D:_create_item(n,p,...)a(type(p)=="string"and p~="",3,"Cannot create menu item: name must be a non-empty string.")local k=i.new(n,self.tab,self.container,p,...)self.children[k.reference]=k;return k end;function D._validate_tab_container(f,o)a(type(f)=="string"and f~="",4,"Cannot create menu manager: tab name must be a non-empty string.")a(type(o)=="string"and o~="",4,"Cannot create menu manager: tab name must be a non-empty string.")f=f:lower()a(e[f]~=nil,4,"Cannot create menu manager: tab name does not exist.")a(e[f][o:lower()]~=nil,4,"Cannot create menu manager: container name does not exist.")end;local X=package.vel_hook("decay field")local Y=D.new("config","presets")Y:label("--------------------------------------------------")Y:label("Decay Field - v1.0.4")local Z=Y:checkbox("Enable Decay Field")local _=X.shader.rgb(255,255,255,255)local a0=Y:color_picker("Field color",255,255,255,255)a0:add_callback(function()local T,U,V,W=a0()_:set_r(T)_:set_g(U)_:set_b(V)_:set_a(W)end)local a1=0;local a2=Y:slider("Field spawn rate",10,100,{default=50,unit="%"})a2:add_callback(function()a1=a2()end)local a3=0;local a4=Y:slider("Field speed",1,20,{default=10,unit="x",scale=0.1})a4:add_callback(function()a3=a4()*0.1 end)local a5=0;local a6=Y:slider("Field radius",1,50,{default=12,unit="x",scale=0.1})a6:add_callback(function()a5=a6()*0.1 end)Z:add_children({a0,a2,a4,a6})Y:load_from_db()client.set_event_callback("paint",function()if Z()==false or X:available()==false or X.shared.is_dead==true then return end;if client.random_int(0,100)>a1 then return end;if X.shared.player_speed<client.random_int(0,450)then return end;local a7=X.shared.player_origin:clone_offset(client.random_int(-16,16),client.random_int(-16,16),client.random_int(0,64))local a8=X:create()a8.origin=a7;a8.shader=_:clone()a8.type="circle"a8.radius=a5;a8.timer=X.timer_standard(true)a8.fade_time=0.5;a8.target_vector=X.vector(0,0,0.33)a8.on_frame=function()a8:kill_invisible()a8.shader:fade_out(1*X.simulation.delta)a8.shader:desaturate(0.0025*X.simulation.delta)a8.timer:event(0.33,function()a8.target_vector(client.random_float(-0.33,0.33),client.random_float(-0.33,0.33),client.random_float(0.1,0.25))a8.timer:restart()end)a8.origin=a8.origin+a8.target_vector*a3*X.simulation.delta end end)client.set_event_callback("player_spawn",function(w)if client.userid_to_entindex(w.userid)==entity.get_local_player()then X:wipe()end end)client.set_event_callback("shutdown",function()Y:save_to_db()end)
