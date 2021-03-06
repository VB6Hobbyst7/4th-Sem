library ieee;  
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
 
 entity nrd is
 port
 (
     q : in std_logic_vector(4 downto 1);
     m : in std_logic_vector(4 downto 1);
     r : out std_logic_vector(4 downto 1);
     q0 : out std_logic_vector(4 downto 1)
     
  );
  
  end nrd;
  architecture arc of nrd is
  
  begin
  
  process(q,m)
     
  variable a: std_logic_vector(4 downto 1);
  variable qv: std_logic_vector(4 downto 1);
  variable mv: std_logic_vector(4 downto 1);
  
  begin
  
  qv:=q;
  mv:=m;
  a:="0000";
  
  for i in 4 downto 1 loop
       if(a(4)='0')then
       a(4 downto 2):=a(3 downto 1);       
       a(1):=qv(4);
       qv(4 downto 2):=qv(3 downto 1);
       a(4 downto 1):=a(4 downto 1) + (not mv(4 downto 1)) + 1;
    elsif(a(4)='1')then
        a(4 downto 2):=a(3 downto 1);
        a(1):=qv(4);
        a(4 downto 2):= a(3 downto 1);
        a(4 downto 1):=a(4 downto 1) + mv(4 downto 1);
            
   end if;
   
   if (a(4)='0')then
      qv(1):='1';
   elsif(a(4)='1')then 
      qv(1):='0';
   end if;
   
  end loop;
  
    if(a(4)='1')then
      a(4 downto 1):=a(4 downto 1)+ mv(4 downto 1);
      
  end if;
  
 q0<=qv;
 
 r<=a;
 
 end process;
 
 end arc;       
