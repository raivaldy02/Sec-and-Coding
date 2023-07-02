kata = "pW¾p    š       GET wss://[host]/ HTTP/1.1[crlf]Host: bug[crlf]Upgrade: Websocket[crlf][crlf]   pW¾p    .       www.skillacademy.com:80 pW¾p           false   pW¾p           false   pW¾p           lifeTimepW¾p           true    pW¾p    é      S e l a m a t   d a t a n g     I n i   c o n f i g   j a n g a n   d i   p a k a i   m a  s i y a t   y a   d o s a   . . d o s a   t a n g g u n g   s e n d i r i   . g u n a k a n   d e n g a n   b i j a k   . s e r v e r   s i n g a p u r a   <ØøÝ<ØìÝ<ØøÝ<ØìÝ<ØøÝ<ØìÝ<ØøÝ<ØìÝ  s p e e d   m a n t a p   b e d a   t k p   b e d a   r a s a   . j i k a l a u   d c   o n   o f f   d a t a   k l u   m a s i h   d c   m o d e   p e s a w a t   k l u   t e r u s      n   d c   s e r v e r   s s h   l g i   d o w n   . n n t i   j u g a   m m b a i k . . . k l u   m a l a s   n u n g g u   g a n t i   s s h   n y a   p a k a i   s s h   a n d a l a n   k a m u   . . . . ! ! !  Ç%Ç%  : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : Ç%Ç%  %  n o   S P A M   %  n o   D D O S   %  n o   P O R N   %  n o   H A C K I N G   %  n o   T O R R E N T   %  n o   C A R D I N G   %  n o   C R I M I N A L   C Y B E R  Ç%Ç%: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : Ç%Ç%  K a m u   m a u   u p d a t e   n   c o n f i g   s a y a   . .  G a b u n g   d i   g r u p   c h a n e l   t e l e g r a m   s a y a          =ØIÜ=ØIÜ=ØIÜ=ØIÜ  h t t p s : / / t . m e / I N j e c t K 0 u t a  A t a u   c h a n n e l   y o u t u b e   s a y a  =ØIÜ=ØIÜ  h t t p s : / / y o u t u b e . c o m / @ b a n g h a i k a l l 6 3 2   S e k i a n   d a r i   s a y a   w s s l m           pW¾p    V       sgovh1.sshws.me:80@sshocean-jampangin:12345     pW¾p           false   pW¾p           false   pW¾p            pW¾p            pW¾p            pW¾p           true    pW¾p            pW¾p           true    pW¾p           false   pW¾p            pW¾p           by Abdul holik  pW¾p           false   pW¾p           1       pW¾p           false   pW¾p            pW¾p           false   pW¾p    8       [splitPsiphon][splitPsiphon]    pW¾p           false   pW¾p            pW¾p           489     pW¾p           false   pW¾p            pW¾p            "

-- 
val, separator = string.match(kata, "(false)[%s]+(.-)[%s]+")
replaceSeparator = string.gsub(kata, separator, "\n")

-- print(replaceSeparator)

for value in string.gmatch(replaceSeparator, "[^\n]+") do
    data = string.gsub(value, "^%s*(.-)%s*$", "%1")
    print(data)
end

-- for i, value in ipairs(string.split(babi, separator)) do
-- print(string.format("%d : %s", i, value:gsub("^%s*(.-)%s*$", "%1")))
-- end

-- mata = string.sub(kata, string.find(kata, "([%w%-%.]+):[%d]+@[%w%-]+:[%w]+" ))
-- print (mata)