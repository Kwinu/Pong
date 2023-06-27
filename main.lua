pad ={}
pad.x = 0
pad.y = 0
pad.largeur = 20
pad.hauteur = 80

pad_2 ={}
pad_2.x = love.graphics.getWidth() - pad.largeur
pad_2.y = love.graphics.getHeight() -pad.hauteur
pad_2.largeur = 20
pad_2.hauteur = 80


balle = {}
balle.x = love.graphics.getWidth() / 2
balle.y = love.graphics.getHeight() / 2
balle.largeur = 20
balle.hauteur = 20
balle.vitesse_x = 5
balle.vitesse_y = 5

score_joueur1 = 0
score_joueur2 = 0


function CentreBalle()
  
  balle.x = love.graphics.getWidth() / 2 - balle.largeur / 2
  balle.y = love.graphics.getHeight() / 2 - balle.hauteur / 2  
  balle.vitesse_x = 2
  balle.vitesse_y = 2
  
  end
function love.load()
  CentreBalle()
  
  pad.x = 0
  pad.y = 0 
  
  pad_2.x = love.graphics.getWidth() - pad.largeur
  pad_2.y = love.graphics.getHeight() - pad.hauteur
  
end

function love.update()
  if love.keyboard.isDown("s") and pad.y < love.graphics.getHeight() - pad.hauteur then
    pad.y = pad.y+ 3
  end
  if love.keyboard.isDown("z") and pad.y > 0 then
    pad.y = pad.y - 3
  end
  
   if love.keyboard.isDown("down") and pad_2.y < love.graphics.getHeight() - pad_2.hauteur then
    pad_2.y = pad_2.y + 3
  end
  if love.keyboard.isDown("up") and pad_2.y > 0 then
    pad_2.y = pad_2.y - 3
  end
  
  balle.x = balle.x + balle.vitesse_x
  balle.y = balle.y + balle.vitesse_y
  
  if balle.y > love.graphics.getHeight() - balle.hauteur then
    balle.vitesse_y = -balle.vitesse_y
  end
  if balle.x > love.graphics.getWidth() - balle.largeur then
    CentreBalle()
    score_joueur1 = score_joueur1 + 1
  end
  if balle.y < 0 or balle.y > love.graphics.getHeight() then
    balle.vitesse_y = -balle.vitesse_y
  end
  if balle.x < 0 or balle.x >love.graphics.getWidth() then
    CentreBalle()
    score_joueur2 = score_joueur2 + 1
  end
  


  if balle.x <= pad.x + pad.largeur then
    if balle.y + balle.hauteur > pad.y and balle.y < pad.y + pad.hauteur then 
      balle.vitesse_x = -balle.vitesse_x
      balle.x = pad.x + pad.largeur
    end
  end
  
  if balle.x + balle.largeur >= pad_2.x then
    if balle.y + balle.hauteur > pad_2.y and balle.y < pad_2.y + pad_2.hauteur then 
      balle.vitesse_x = -balle.vitesse_x
    end
  end

end

function love.draw()
  love.graphics.rectangle("fill",pad.x, pad.y, pad.largeur, pad.hauteur)
  love.graphics.rectangle("fill",pad_2.x, pad_2.y, pad_2.largeur, pad_2.hauteur)

  love.graphics.circle("fill", balle.x, balle.y, balle.largeur, balle.hauteur)
  
  local score = score_joueur1 .. "-" .. score_joueur2
  love.graphics.print(score, love.graphics.getWidth() / 2)

  
end

