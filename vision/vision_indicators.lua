function math.round(a,b)local c=10^(b or 0)return math.floor(a*c+0.5)/c end;local d={}local e={__index=d}e.__call=function(f,g,h,i)g=g or f.p;h=h or f.y;i=i or f.r;f.p=g;f.y=h;f.r=i end;local function f(j,k,l)return setmetatable({p=j and j or 0,y=k and k or 0,r=l and l or 0},e)end;function d:offset(m,n,o)m=self.p+m or 0;n=self.y+n or 0;o=self.r+o or 0;self.p=self.p+m;self.y=self.y+n;self.r=self.r+o end;function d:clone()return setmetatable({p=self.p,y=self.y,r=self.r},e)end;function d:clone_offset(m,n,o)m=self.p+m or 0;n=self.y+n or 0;o=self.r+o or 0;return f(self.p+m,self.y+n,self.r+o)end;function d:unpack()return self.p,self.y,self.r end;function d:nullify()self.p=0;self.y=0;self.r=0 end;function e.__tostring(p)return string.format("%s, %s, %s",p.p,p.y,p.r)end;function e.__concat(p)return string.format("%s, %s, %s",p.p,p.y,p.r)end;function e.__add(p,q)if type(p)=="number"then return f(p+q.p,p+q.y,p+q.r)end;if type(q)=="number"then return f(p.p+q,p.y+q,p.r+q)end;return f(p.p+q.p,p.y+q.y,p.r+q.r)end;function e.__sub(p,q)if type(p)=="number"then return f(p-q.p,p-q.y,p-q.r)end;if type(q)=="number"then return f(p.p-q,p.y-q,p.r-q)end;return f(p.p-q.p,p.y-q.y,p.r-q.r)end;function e.__mul(p,q)if type(p)=="number"then return f(p*q.p,p*q.y,p*q.r)end;if type(q)=="number"then return f(p.p*q,p.y*q,p.r*q)end;return f(p.p*q.p,p.y*q.y,p.r*q.r)end;function e.__div(p,q)if type(p)=="number"then return f(p/q.p,p/q.y,p/q.r)end;if type(q)=="number"then return f(p.p/q,p.y/q,p.r/q)end;return f(p.p/q.p,p.y/q.y,p.r/q.r)end;function e.__pow(p,q)if type(p)=="number"then return f(math.pow(p,q.p),math.pow(p,q.y),math.pow(p,q.r))end;if type(q)=="number"then return f(math.pow(p.p,q),math.pow(p.y,q),math.pow(p.r,q))end;return f(math.pow(p.p,q.p),math.pow(p.y,q.y),math.pow(p.r,q.r))end;function e.__mod(p,q)if type(p)=="number"then return f(p%q.p,p%q.y,p%q.r)end;if type(q)=="number"then return f(p.p%q,p.y%q,p.r%q)end;return f(p.p%q.p,p.y%q.y,p.r%q.r)end;function e.__unm(p)return f(-p.p,-p.y,-p.r)end;function d:round_zero()self.p=math.floor(self.p+0.5)self.y=math.floor(self.y+0.5)self.r=math.floor(self.r+0.5)end;function d:round(b)self.p=math.round(self.p,b)self.y=math.round(self.y,b)self.r=math.round(self.r,b)end;function d:round_base(r)self.p=r*math.round(self.p/r)self.y=r*math.round(self.y/r)self.r=r*math.round(self.r/r)end;function d:rounded_zero()return f(math.floor(self.p+0.5),math.floor(self.y+0.5),math.floor(self.r+0.5))end;function d:rounded(b)return f(math.round(self.p,b),math.round(self.y,b),math.round(self.r,b))end;function d:rounded_base(r)return f(r*math.round(self.p/r),r*math.round(self.y/r),r*math.round(self.r/r))end;local s={}local t={__index=s}t.__call=function(u,v,h,w)v=v or u.x;h=h or u.y;w=w or u.z;u.x=v;u.y=h;u.z=w end;local function u(x,k,y)return setmetatable({x=x and x or 0,y=k and k or 0,z=y and y or 0},t)end;function s:offset(z,n,A)z=z or 0;n=n or 0;A=A or 0;self.x=self.x+z;self.y=self.y+n;self.z=self.z+A end;function s:clone()return setmetatable({x=self.x,y=self.y,z=self.z},t)end;function s:clone_offset(z,n,A)z=z or 0;n=n or 0;A=A or 0;return setmetatable({x=self.x+z,y=self.y+n,z=self.z+A},t)end;function s:unpack()return self.x,self.y,self.z end;function s:nullify()self.x=0;self.y=0;self.z=0 end;function t.__tostring(p)return string.format("%s, %s, %s",p.x,p.y,p.z)end;function t.__concat(p)return string.format("%s, %s, %s",p.x,p.y,p.z)end;function t.__eq(p,q)return p.x==q.x and p.y==q.y and p.z==q.z end;function t.__lt(p,q)if type(p)=="number"then return p<q.x or p<q.y or p<q.z end;if type(q)=="number"then return p.x<q or p.y<q or p.z<q end;return p.x<q.x or p.y<q.y or p.z<q.z end;function t.__le(p,q)if type(p)=="number"then return p<=q.x or p<=q.y or p<=q.z end;if type(q)=="number"then return p.x<=q or p.y<=q or p.z<=q end;return p.x<=q.x or p.y<=q.y or p.z<=q.z end;function t.__add(p,q)if type(p)=="number"then return u(p+q.x,p+q.y,p+q.z)end;if type(q)=="number"then return u(p.x+q,p.y+q,p.z+q)end;return u(p.x+q.x,p.y+q.y,p.z+q.z)end;function t.__sub(p,q)if type(p)=="number"then return u(p-q.x,p-q.y,p-q.z)end;if type(q)=="number"then return u(p.x-q,p.y-q,p.z-q)end;return u(p.x-q.x,p.y-q.y,p.z-q.z)end;function t.__mul(p,q)if type(p)=="number"then return u(p*q.x,p*q.y,p*q.z)end;if type(q)=="number"then return u(p.x*q,p.y*q,p.z*q)end;return u(p.x*q.x,p.y*q.y,p.z*q.z)end;function t.__div(p,q)if type(p)=="number"then return u(p/q.x,p/q.y,p/q.z)end;if type(q)=="number"then return u(p.x/q,p.y/q,p.z/q)end;return u(p.x/q.x,p.y/q.y,p.z/q.z)end;function t.__pow(p,q)if type(p)=="number"then return u(math.pow(p,q.x),math.pow(p,q.y),math.pow(p,q.z))end;if type(q)=="number"then return u(math.pow(p.x,q),math.pow(p.y,q),math.pow(p.z,q))end;return u(math.pow(p.x,q.x),math.pow(p.y,q.y),math.pow(p.z,q.z))end;function t.__mod(p,q)if type(p)=="number"then return u(p%q.x,p%q.y,p%q.z)end;if type(q)=="number"then return u(p.x%q,p.y%q,p.z%q)end;return u(p.x%q.x,p.y%q.y,p.z%q.z)end;function t.__unm(p)return u(-p.x,-p.y,-p.z)end;function s:length2_squared()return self.x*self.x+self.y*self.y end;function s:length2()return math.sqrt(self:length2_squared())end;function s:length_squared()return self.x*self.x+self.y*self.y+self.z*self.z end;function s:length()return math.sqrt(self:length_squared())end;function s:dot_product(B)return self.x*B.x+self.y*B.y+self.z*B.z end;function s:cross_product(B)return s(self.y*B.z-self.z*B.y,self.z*B.x-self.x*B.z,self.x*B.y-self.y*B.x)end;function s:distance2(B)return(B-self):length2()end;function s:distance(B)return(B-self):length()end;function s:distance_x(B)return math.abs(self.x-B.x)end;function s:distance_y(B)return math.abs(self.y-B.y)end;function s:distance_z(B)return math.abs(self.z-B.z)end;function s:in_range(B,C)return self:distance(B)<=C end;function s:round_zero()self.x=math.floor(self.x+0.5)self.y=math.floor(self.y+0.5)self.z=math.floor(self.z+0.5)end;function s:round(b)self.x=math.round(self.x,b)self.y=math.round(self.y,b)self.z=math.round(self.z,b)end;function s:round_base(r)self.x=r*math.round(self.x/r)self.y=r*math.round(self.y/r)self.z=r*math.round(self.z/r)end;function s:rounded_zero()return u(math.floor(self.x+0.5),math.floor(self.y+0.5),math.floor(self.z+0.5))end;function s:rounded(b)return u(math.round(self.x,b),math.round(self.y,b),math.round(self.z,b))end;function s:rounded_base(r)return u(r*math.round(self.x/r),r*math.round(self.y/r),r*math.round(self.z/r))end;function s:normalize()local D=self:length()if D~=0 then self.x=self.x/D;self.y=self.y/D;self.z=self.z/D else self.x=0;self.y=0;self.z=1 end end;function s:normalized_length()return self:length()end;function s:normalized()local D=self:length()if D~=0 then return u(self.x/D,self.y/D,self.z/D)else return u(0,0,1)end end;function s:to_screen(E)local x,k=renderer.world_to_screen(self.x,self.y,self.z)if x==nil or k==nil then return nil end;if E==true then local F,G=client.screen_size()if x<0 or x>F or k<0 or k>G then return nil end end;return u(x,k)end;function s:magnitude()return math.sqrt(math.pow(self.x,2)+math.pow(self.y,2)+math.pow(self.z,2))end;function s:angle_to(H)local I=u(H.x-self.x,H.y-self.y,H.z-self.z)if I.x==0 and I.y==0 then return f(I.z>0 and 270 or 90,0)else local J=math.deg(math.atan2(I.y,I.x))local K=math.sqrt(I.x*I.x+I.y*I.y)local L=math.deg(math.atan2(-I.z,K))return f(L,J)end end;function s:trace_line_to(H,M)M=M or-1;return client.trace_line(M,self.x,self.y,self.z,H.x,H.y,H.z)end;function s:lerp(H,N)return self+(H-self)*N end;function s:trace_line_impact(H,M)M=M or-1;local O,P=client.trace_line(M,self.x,self.y,self.z,H.x,H.y,H.z)local Q=self:lerp(H,O)return O,P,Q end;function s:trace_line_skip(H,R,S)S=S or 10;local O,P=0,-1;local Q=self;local T=0;while S>=T and O<1 and(P>-1 and R(P)or Q==self)do O,P,Q=Q:trace_line_impact(H,P)T=T+1 end;return self:distance(Q)/self:distance(H),P,Q end;function s:trace_bullet_to(U,H)return client.trace_bullet(U,self.x,self.y,self.z,H.x,H.y,H.z)end;function s:closest_ray_point(V,H)local W=(H-V)/V:distance(H)local X=self-V;local D=X:dot_product(W)return V+W*D end;function s:divide_ray(H,Y)return(self*Y+H)/(1+Y)end;local function Z(V,H,_,a0)return u((V.x*a0+H.x*_)/(_+a0),(V.y*a0+H.y*_)/(_+a0),(V.z*a0+H.z*_)/(_+a0))end;function s:segment_ray(H,a1)local a2={}for T=0,a1 do a2[T]=Z(self,H,T,a1-T)end;return a2 end;function s:ray(H,a3)a3=a3 or 128;local a1={}local a4=self:distance(H)/a3;local f=self:angle_to(H)local W=f:to_forward_vector()for T=1,a3 do table.insert(a1,self+W*a4*T)end;local a5=u(0,0,0)local a6=u(0,0,0)local a7=false;local a8=false;for T=1,#a1 do a5=a1[T]:to_screen()if a5~=nil then a7=true;break end end;for T=#a1,1,-1 do a6=a1[T]:to_screen()if a6~=nil then a8=true;break end end;if a7 and a8 then return a5,a6 end;return nil end;function d:to_forward_vector()local a9=function(aa)return aa*math.pi/180 end;local ab=math.sin(a9(self.p))local ac=math.cos(a9(self.p))local ad=math.sin(a9(self.y))local ae=math.cos(a9(self.y))return u(ac*ae,ac*ad,-ab)end;function d:to_up_vector()local a9=function(aa)return aa*math.pi/180 end;local ab=math.sin(a9(self.p))local ac=math.cos(a9(self.p))local ad=math.sin(a9(self.y))local ae=math.cos(a9(self.y))local af=math.sin(a9(self.r))local ag=math.cos(a9(self.r))return u(ag*ab*ae+af*ad,ag*ab*ad+af*ae*-1,ag*ac)end;function d:to_right_vector()local a9=function(aa)return aa*math.pi/180 end;local ab=math.sin(a9(self.p))local ac=math.cos(a9(self.p))local ad=math.sin(a9(self.y))local ae=math.cos(a9(self.y))local af=math.sin(a9(self.r))local ag=math.cos(a9(self.r))return u(af*ab*ae*-1+ag*ad,af*ab*ad*-1+-1*ag*ae,-1*af*ac)end;function d:to_backward_vector()local a9=function(aa)return aa*math.pi/180 end;local ab=math.sin(a9(self.p))local ac=math.cos(a9(self.p))local ad=math.sin(a9(self.y))local ae=math.cos(a9(self.y))return-u(ac*ae,ac*ad,-ab)end;function d:to_left_vector()local a9=function(aa)return aa*math.pi/180 end;local ab=math.sin(a9(self.p))local ac=math.cos(a9(self.p))local ad=math.sin(a9(self.y))local ae=math.cos(a9(self.y))local af=math.sin(a9(self.r))local ag=math.cos(a9(self.r))return-u(af*ab*ae*-1+ag*ad,af*ab*ad*-1+-1*ag*ae,-1*af*ac)end;function d:to_down_vector()local a9=function(aa)return aa*math.pi/180 end;local ab=math.sin(a9(self.p))local ac=math.cos(a9(self.p))local ad=math.sin(a9(self.y))local ae=math.cos(a9(self.y))local af=math.sin(a9(self.r))local ag=math.cos(a9(self.r))return-u(ag*ab*ae+af*ad,ag*ab*ad+af*ae*-1,ag*ac)end;function d:fov_to(V,H)local ah=self:to_forward_vector()local ai=(H-V):normalized()local aj=math.acos(ah:dot_product(ai)/ai:length())return math.max(0.0,math.deg(aj))end;function d:bearing(b)local J=180-self.y+90;local aa=(J%360+360)%360;aa=aa>180 and aa-360 or aa;return math.round(aa+180,b)end;function d:start_degrees()local J=self.y;local aa=(J%360+360)%360;aa=aa>180 and aa-360 or aa;return aa+180 end;function d:normalize()local L=self.p;if L<-89 then L=-89 elseif L>89 then L=89 end;local J=self.y;while J>180 do J=J-360 end;while J<-180 do J=J+360 end;return f(L,J,0)end;function d:normalized()if self.p<-89 then self.p=-89 elseif self.p>89 then self.p=89 end;local J=self.y;while J>180 do J=J-360 end;while J<-180 do J=J+360 end;self.y=J;self.r=0 end;local ak={}local al={__index=ak,__call=function(am,l,an,ao,ap)if l~=nil then am:set_r(l)am:set_g(an)am:set_b(ao)am:set_a(ap)else return am:unpack()end end}function al.__tostring(aq)return string.format("%s, %s, %s, %s",aq.r,aq.g,aq.b,aq.a)end;function al.__concat(aq)return string.format("%s, %s, %s, %s",aq.r,aq.g,aq.b,aq.a)end;function ak.rgb(l,an,ao,ap,ar)if ap==nil then ap=255 end;local as=ak.new(l,an,ao,0,0,0,ap,ar)as:validate_rgb_space()as:update_hsl_space()return as end;function ak.hsl(at,au,av,ap,ar)if ap==nil then ap=255 end;local as=ak.new(0,0,0,at,au,av,ap,ar)as:validate_hsl_space()as:update_rgb_space()return as end;function ak.hex(aw,ar)local l,an,ao,ap=ak.hex_to_rgb(aw)local as=ak.new(l,an,ao,0,0,0,ap,ar)as:validate_rgb_space()as:update_hsl_space()return as end;function ak.new(l,an,ao,at,au,av,ap,ar)ar=ar or true;local ax;if ar==true then ax=function(am,ay)if ay==0 then am:update_rgb_space()else am:update_hsl_space()end end else ax=function(am,ay)if ay==0 then am.rgb_updated=false else am.hsl_updated=false end end end;local az={r=l,g=an,b=ao,h=at,s=au,l=av,a=ap,update_method=ax,rgb_updated=true,hsl_updated=true}return setmetatable(az,al)end;function ak:clone()local az={r=self.r,g=self.g,b=self.b,h=self.h,s=self.s,l=self.l,a=self.a,rgb_updated=true,hsl_updated=true,update_method=self.update_method}return setmetatable(az,al)end;function ak:unpack()return self.r,self.g,self.b,self.a end;function ak.hex_to_rgb(aw)local D=aw:len()if D==3 then local aA=aw:sub(2)aw=aw..aA..aA elseif D==4 then aw=aw..aw:sub(2)end;aw=aw:gsub("#","")local l=tonumber("0x"..aw:sub(1,2))local an=tonumber("0x"..aw:sub(3,4))local ao=tonumber("0x"..aw:sub(5,6))local ap=tonumber("0x"..aw:sub(7,8))if ap==nil then ap=255 end;return l,an,ao,ap end;function ak:update_spaces()if self.rgb_updated==false then self:update_rgb_space()self.rgb_updated=true elseif self.hsl_updated==false then self:update_hsl_space()self.hsl_updated=true end end;function ak:update_rgb_space()local l,an,ao;if self.s==0 then l,an,ao=self.l,self.l,self.l else local function aB(j,aC,aD)if aD<0 then aD=aD+1 end;if aD>1 then aD=aD-1 end;if aD<1/6 then return j+(aC-j)*6*aD end;if aD<1/2 then return aC end;if aD<2/3 then return j+(aC-j)*(2/3-aD)*6 end;return j end;local aC=0;if self.l<0.5 then aC=self.l*(1+self.s)else aC=self.l+self.s-self.l*self.s end;local j=2*self.l-aC;local at=self.h/360;l=aB(j,aC,at+1/3)an=aB(j,aC,at)ao=aB(j,aC,at-1/3)end;self.r=l*255;self.g=an*255;self.b=ao*255 end;function ak:update_hsl_space()local l,an,ao=self.r/255,self.g/255,self.b/255;local aE,aF=math.max(l,an,ao),math.min(l,an,ao)local at,au,av;av=(aE+aF)/2;if aE==aF then at,au=0,0 else local aG=aE-aF;if av>0.5 then au=aG/(2-aE-aF)else au=aG/(aE+aF)end;if aE==l then at=(an-ao)/aG;if an<ao then at=at+6 end elseif aE==an then at=(ao-l)/aG+2 elseif aE==ao then at=(l-an)/aG+4 end;at=at/6*360 end;self.h,self.s,self.l=at,au,av or 255 end;function ak:validate_rgb_space()self.r=math.min(255,math.max(0,self.r))self.g=math.min(255,math.max(0,self.g))self.b=math.min(255,math.max(0,self.b))self.a=math.min(255,math.max(0,self.a))end;function ak:validate_hsl_space()self.h=math.min(360,math.max(0,self.h))self.s=math.min(1,math.max(0,self.s))self.l=math.min(1,math.max(0,self.l))self.a=math.min(255,math.max(0,self.a))end;function ak:set_r(l)self.r=l;self.update_method(self,1)end;function ak:set_g(an)self.g=an;self.update_method(self,1)end;function ak:set_b(ao)self.b=ao;self.update_method(self,1)end;function ak:set_h(at)self.h=at;self.update_method(self,0)end;function ak:set_s(au)self.s=au;self.update_method(self,0)end;function ak:set_l(av)self.l=av;self.update_method(self,0)end;function ak:set_a(ap)self.a=ap end;function ak:contrast(aH)aH=aH or 150;local aI=self.r*0.213+self.g*0.715+self.b*0.072;if aI<aH then return 0 end;return 1 end;function ak:shift_hue(aJ)self.h=(self.h+aJ)%360;self.update_method(self,0)end;function ak:shift_saturation(aJ)self.s=math.min(1,math.max(0,self.s+aJ))self.update_method(self,0)end;function ak:shift_lightness(aJ)self.l=math.min(1,math.max(0,self.l+aJ))self.update_method(self,0)end;function ak:lighten(aJ)self.l=math.min(1,math.max(0,self.l+aJ))self.update_method(self,0)end;function ak:darken(aJ)self.l=math.min(1,math.max(0,self.l-aJ))self.update_method(self,0)end;function ak:saturate(aJ)self.s=math.min(1,math.max(0,self.s+aJ))self.update_method(self,0)end;function ak:desaturate(aJ)self.s=math.min(1,math.max(0,self.s-aJ))self.update_method(self,0)end;function ak:fade_in(aJ)if self.a==255 then return end;self.a=self.a+aJ;if self.a>255 then self.a=255 end end;function ak:fade_out(aJ)if self.a==0 then return end;self.a=self.a-aJ;if self.a<0 then self.a=0 end end;function ak:is_invisible()return self.a==0 end;function ak:is_visible()return self.a>0 end;local function aK(aL,aM,aN,...)if not aL then error(string.format(aN,...),aM)end end;local aO={rage={"aimbot","other"},aa={"anti-aimbot angles","fake lag","other"},legit={"weapon type","aimbot","triggerbot","other"},visuals={"player esp","other esp","colored models","effects"},misc={"miscellaneous","settings","lua","other"},skins={"weapon skin","knife options","glove options"},config={"presets","lua"},players={"players","adjustments"},lua={"a","b"}}for aP,aQ in pairs(aO)do aO[aP]={}for T=1,#aQ do aO[aP][aQ[T]]=true end end;local aR={}local aS={__index=aR}function aS.__call(aT,...)local aU={...}if#aU==0 then return aT:get()end;local aV={pcall(aT.set,aT,unpack(aU))}aK(aV[1],4,aV[2])return aT end;function aR.new(aW,aP,aX,aY,...)local aZ;local a_=false;if type(aW)=="function"then local b0={pcall(aW,aP,aX,aY,...)}aK(b0[1],4,"Cannot create menu item because: %s",b0[2])aZ=b0[2]else aZ=aW;a_=true end;return setmetatable({tab=aP,container=aX,name=aY,reference=aZ,visible=true,hidden_value=nil,children={},ui_callback=nil,callbacks={},is_menu_reference=a_,getter={callback=nil,data=nil},setter={callback=nil,data=nil},parent_value_or_callback=nil},aS)end;function aR:set_hidden_value(b1)self.hidden_value=b1 end;function aR:set(...)local aU={...}if self.setter.callback~=nil then aU=self.setter.callback(unpack(aU))end;local aV={pcall(ui.set,self.reference,unpack(aU))}aK(aV[1],3,"Cannot set values of menu item because: %s",aV[2])end;function aR:get()if self.visible==false and self.hidden_value~=nil then return self.hidden_value end;local b2={ui.get(self.reference)}if self.getter.callback~=nil then return self.getter.callback(b2)end;return unpack(b2)end;function aR:set_setter_callback(R,b3)aK(type(R)=="function",3,"Cannot set menu item setter callback: argument must be a function.")self.setter.callback=R;self.setter.data=b3 end;function aR:set_getter_callback(R,b3)aK(type(R)=="function",3,"Cannot set menu item getter callback: argument must be a function.")self.getter.callback=R;self.getter.data=b3 end;function aR:add_children(b4,b5)if b5==nil then b5=true end;if getmetatable(b4)==aS then b4={b4}end;for b6,b7 in pairs(b4)do aK(getmetatable(b7)==aS,3,"Cannot add child to menu item: children must be menu item objects. Make sure you are not trying to parent a UI reference.")aK(b7.reference~=self.reference,3,"Cannot parent a menu item to iself.")b7.parent_value_or_callback=b5;self.children[b7.reference]=b7 end;aR._process_callbacks(self)end;function aR:add_callback(R)aK(self.is_menu_reference==false,3,"Cannot add callbacks to built-in menu items.")aK(type(R)=="function",3,"Callbacks for menu items must be functions.")table.insert(self.callbacks,R)aR._process_callbacks(self)end;function aR._process_callbacks(aT)local R=function()for b6,b7 in pairs(aT.children)do local b8;if type(b7.parent_value_or_callback)=="function"then b8=b7.parent_value_or_callback()else b8=aT:get()==b7.parent_value_or_callback end;local b9=b8==true and aT.visible==true;b7.visible=b9;ui.set_visible(b7.reference,b9)if b7.ui_callback~=nil then b7.ui_callback()end end;for T=1,#aT.callbacks do aT.callbacks[T]()end end;ui.set_callback(aT.reference,R)aT.ui_callback=R;R()end;local ba={}local bb={__index=ba}function ba.new(aP,aX)ba._validate_tab_container(aP,aX)return setmetatable({tab=aP,container=aX,children={}},bb)end;function ba:save_to_db()local bc=string.format("%s_%s",self.tab,self.container)for b6,aT in pairs(self.children)do local bd=string.format("%s_%s",bc,aT.name)local b3={aT()}database.write(bd,b3)end end;function ba:load_from_db()local bc=string.format("%s_%s",self.tab,self.container)for b6,aT in pairs(self.children)do local bd=string.format("%s_%s",bc,aT.name)local b3=database.read(bd)if b3~=nil then aT(unpack(b3))end end end;function ba:parent_all_to(aT,b5)local b4=self.children;b4[aT.reference]=nil;aT:add_children(b4,b5)end;function ba.reference(aP,aX,aY)ba._validate_tab_container(aP,aX)local be={pcall(ui.reference,aP,aX,aY)}aK(be[1],3,"Cannot reference Gamesense menu item because: %s",be[2])local bf={select(2,unpack(be))}local bg={}for T=1,#bf do table.insert(bg,aR.new(bf[T],aP,aX,aY))end;return unpack(bg)end;function ba:checkbox(aY)return self:_create_item(ui.new_checkbox,aY)end;function ba:slider(aY,aF,aE,bh,bi,bj,bk,bl)if type(bh)=="table"then local bm=bh;bh=bm.default;bi=bm.show_tooltip;bj=bm.unit;bk=bm.scale;bl=bm.tooltips end;bh=bh or nil;bi=bi or true;bj=bj or nil;bk=bk or 1;bl=bl or nil;aK(type(aF)=="number",3,"Slider min value must be a number.")aK(type(aE)=="number",3,"Slider max value must be a number.")aK(aF<aE,3,"Slider min value must be below the max value.")if bh~=nil then aK(bh>=aF and bh<=aE,3,"Slider default must be between min and max values.")end;return self:_create_item(ui.new_slider,aY,aF,aE,bh,bi,bj,bk,bl)end;function ba:combobox(aY,...)local aU={...}if type(aU[1])=="table"then aU=aU[1]end;return self:_create_item(ui.new_combobox,aY,aU)end;function ba:multiselect(aY,...)local aU={...}if type(aU[1])=="table"then aU=aU[1]end;return self:_create_item(ui.new_multiselect,aY,aU)end;function ba:hotkey(aY,bn)if bn==nil then bn=false end;aK(type(bn)=="boolean",3,"Hotkey inline argument must be a boolean.")return self:_create_item(ui.new_hotkey,aY,bn)end;function ba:button(aY,R)aK(type(R)=="function",3,"Cannot set button callback because the callback argument must be a function.")return self:_create_item(ui.new_button,aY,R)end;function ba:color_picker(aY,l,an,ao,ap)l=l or 255;an=an or 255;ao=ao or 255;ap=ap or 255;aK(type(l)=="number"and l>=0 and l<=255,3,"Cannot set color picker red channel value. It must be between 0 and 255.")aK(type(an)=="number"and an>=0 and an<=255,3,"Cannot set color picker green channel value. It must be between 0 and 255.")aK(type(ao)=="number"and ao>=0 and ao<=255,3,"Cannot set color picker blue channel value. It must be between 0 and 255.")aK(type(ap)=="number"and ap>=0 and ap<=255,3,"Cannot set color picker alpha channel value. It must be between 0 and 255.")return self:_create_item(ui.new_color_picker,aY,l,an,ao,ap)end;function ba:textbox(aY)return self:_create_item(ui.new_textbox,aY)end;function ba:listbox(aY,...)local aU={...}if type(aU[1])=="table"then aU=aU[1]end;local aT=self:_create_item(ui.new_listbox,aY,aU)aT:set_getter_callback(function(b2)return aT.getter.data[b2+1]end,aU)return aT end;function ba:label(aY)aK(type(aY)=="string","Label name must be a string.")return self:_create_item(ui.new_label,aY)end;function ba:_create_item(aW,aY,...)aK(type(aY)=="string"and aY~="",3,"Cannot create menu item: name must be a non-empty string.")local aT=aR.new(aW,self.tab,self.container,aY,...)self.children[aT.reference]=aT;return aT end;function ba._validate_tab_container(aP,aX)aK(type(aP)=="string"and aP~="",4,"Cannot create menu manager: tab name must be a non-empty string.")aK(type(aX)=="string"and aX~="",4,"Cannot create menu manager: tab name must be a non-empty string.")aP=aP:lower()aK(aO[aP]~=nil,4,"Cannot create menu manager: tab name does not exist.")aK(aO[aP][aX:lower()]~=nil,4,"Cannot create menu manager: container name does not exist.")end;local function bo(aD,bp)local bq={}for br in pairs(aD)do bq[#bq+1]=br end;if bp then table.sort(bq,function(ap,ao)return bp(aD,ap,ao)end)else table.sort(bq)end;local T=0;return function()T=T+1;if bq[T]then return bq[T],aD[bq[T]]end end end;local bs={}local bt={__index=bs}function bs.new(P,am,bu)return setmetatable({eid=P,shader=am,shader_occluded=bu,current_alpha=0,target_alpha=0,min_alpha=5,max_alpha=am.a,is_dormant=false,is_dead=false,on_dormant=false,in_view=false,distance=0},bt)end;local bv={}local bw={__index=bv}function bv.new()return setmetatable({enemies={},screen=u(),screen_center=u(),radius=100,thickness=2,fade=0,length=0.1,shader=ak.rgb(255,0,0,255),shader_occluded=ak.rgb(255,0,0,100),shader_dormant=ak.rgb(100,100,100,100),rainbow=false,rainbow_speed=0,only_oov=false,visible_based_color=false,distance_based_length=false,target_alpha=255,current_alpha=0,max_alpha=255,min_alpha=0,current_thickness=0,radii={}},bw)end;function bv:sync()self.screen(client.screen_size())self.screen_center(self.screen.x/2,self.screen.y/2)end;function bv:render()local T=1;local bx=0;if self.rainbow==true then self.shader:shift_hue(self.rainbow_speed)end;for b6,by in pairs(self.enemies)do if by.current_alpha>1 then bx=bx+1 end end;if bx>0 then local bz=self.thickness-bx*1.5;self.current_thickness=self.current_thickness+(bz-self.current_thickness)*0.025 end;if self.fade==0 then self.current_alpha=self.max_alpha else self.current_alpha=self.current_alpha+(self.target_alpha-self.current_alpha)*self.fade;if self.current_alpha<25 then self.target_alpha=self.max_alpha elseif self.current_alpha>self.max_alpha-25 then self.target_alpha=self.min_alpha end end;for b6,by in bo(self.enemies,function(table,ap,ao)return table[ap].distance<table[ao].distance end)do if self.rainbow==true then by.shader=self.shader:clone()end;local am,bA,bB,bC,D=self:get_enemy_indicator_data(by)renderer.circle_outline(self.screen_center.x,self.screen_center.y,am.r,am.g,am.b,bA,bB-T*self.current_thickness*1.15,bC,D,self.current_thickness)if by.current_alpha>1 then T=T+1 end end end;function bv:process_enemies()for b6,P in pairs(entity.get_players(true))do if self.enemies[P]==nil then self.enemies[P]=bs.new(P,self.shader:clone(),self.shader_occluded:clone())end end;for b6,by in pairs(self.enemies)do if entity.is_enemy(by.eid)==false then self.enemies[by.eid]=nil else local bD=u(entity.get_prop(by.eid,"m_vecOrigin"))local bE=bD:to_screen(true)by.in_view=bE~=nil;by.is_dead=entity.is_alive(by.eid)==false;by.is_dormant=entity.is_dormant(by.eid)if by.on_dormant==false and by.is_dormant==true then by.on_dormant=true;if self.only_oov==true and by.in_view==false then by.current_alpha=255 elseif self.only_oov==false then by.current_alpha=255 end elseif by.on_dormant==true and by.is_dormant==false then by.on_dormant=false end end end end;function bv:update_enemy_shaders()for b6,by in pairs(self.enemies)do by.shader=self.shader:clone()by.shader_occluded=self.shader_occluded:clone()by.max_alpha=by.shader.a;by.current_alpha=by.shader.a end end;function bv:get_enemy_indicator_data(by)local am=by.shader;local bF=u(client.eye_position())if self.visible_based_color==true then am=by.shader_occluded;for T=0,18 do local bG=u(entity.hitbox_position(by.eid,T))local b6,bH=bF:trace_line_skip(bG,function(P)return P==entity.get_local_player()end,4)if bH==by.eid then am=by.shader end end end;if by.is_dormant==true then by.target_alpha=0;am=self.shader_dormant elseif by.is_dead==true then by.target_alpha=0;am=self.shader_dormant elseif by.current_alpha<by.min_alpha then by.target_alpha=by.max_alpha elseif by.current_alpha>by.max_alpha-5 then by.target_alpha=0 end;if by.is_dormant==true then by.current_alpha=math.max(0,by.current_alpha-1)elseif by.is_dead==true then by.current_alpha=math.max(0,by.current_alpha-2)elseif self.only_oov==true and by.in_view==true then by.current_alpha=math.max(0,by.current_alpha-2)else by.current_alpha=self.current_alpha end;local bI=u(entity.get_prop(entity.get_local_player(),"m_vecOrigin"))local bD=u(entity.get_prop(by.eid,"m_vecOrigin"))local D=self.length;local C=bI:distance(bD)by.distance=C;if self.distance_based_length==true then D=math.min(0.33,math.max(0.05,(2048-C)/2048/5))end;local bB=self.radius;local bJ=bI:angle_to(bD)local bK=f(client.camera_angles())local bL=f(0,bJ.y-bK.y,0):normalize()local bC=180-bL:start_degrees()+270;local bM=D*360;bC=bC-bM/2;return am,by.current_alpha,bB,bC,D end;local bN=bv.new()local bO=ba.new("config","presets")bO:label("--------------------------------------------------")bO:label("Indicators - v1.0.2")local bP=bO:checkbox("Enable indicators")local am=bO:color_picker("Indicator main color picker",156,62,62,255)am:add_callback(function()local l,an,ao,ap=am()bN.shader(l,an,ao,ap)bN:update_enemy_shaders()end)local bQ=bO:checkbox("Indicator rainbow mode")bQ:add_callback(function()bN.rainbow=bQ()if bQ()==false then local l,an,ao,ap=am()bN.shader(l,an,ao,ap)bN:update_enemy_shaders()end end)local bR=bO:slider("Indicator rainbow speed",1,100,{default=33,unit="%"})bR:add_callback(function()bN.rainbow_speed=bR()*0.01/2 end)local bS=bO:label("Indicator dormant color")local bT=bO:color_picker("Indicator dormant color picker",71,71,71,255)bT:add_callback(function()local l,an,ao,ap=bT()bN.shader_dormant(l,an,ao,ap)bN:update_enemy_shaders()end)local bU=bO:checkbox("Indicator colors based on visibility")bU:set_hidden_value(false)bU:add_callback(function()bN.visible_based_color=bU()end)local bu=bO:color_picker("Indicator occluded color picker",135,131,97,255)bu:add_callback(function()local l,an,ao,ap=bu()bN.shader_occluded(l,an,ao,ap)bN:update_enemy_shaders()end)bU:add_children({bu})bQ:add_children({bR})bQ:add_children({bU},function()return bQ()==false end)local bV=bO:checkbox("Indicator only out of view")bV:add_callback(function()bN.only_oov=bV()end)local bW=bO:slider("Indicator maximum opacity",10,100,{default=75,unit="%"})bW:add_callback(function()bN.max_alpha=255*bW()*0.01;bN.target_alpha=0 end)local bB=bO:slider("Indicator radius",25,100,{default=60,unit="%"})bB:add_callback(function()bN.radius=400*bB()*0.01 end)local bX=bO:slider("Indicator thickness",8,30,{default=20,unit="x"})bX:add_callback(function()bN.thickness=bX()end)local bY=bO:slider("Indicator fade speed",0,50,{default=10,unit="x",scale=0.1})bY:add_callback(function()bN.fade=bY()*0.001 end)local bZ=bO:checkbox("Indicator length based on distance")bZ:add_callback(function()bN.distance_based_length=bZ()end)local D=bO:slider("Indicator length",25,100,{default=60,unit="%"})D:add_callback(function()bN.length=D()*0.001 end)bZ:add_children({D},function()return bZ()==false end)bP:add_children({bQ,am,bT,bS,bV,bW,bB,bX,bY,bZ})bO:load_from_db()client.set_event_callback("paint",function()if bP()==false or entity.is_alive(entity.get_local_player())==false then return end;bN:sync()bN:process_enemies()bN:render()end)client.set_event_callback("shutdown",function()bO:save_to_db()end)
