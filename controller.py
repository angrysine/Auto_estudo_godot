from extensions import db
from models import Position

class DobotController:

    def add(self,data):
        import datetime
        x = data["x"]
        y = data["y"]
        z = data["z"]
        r = data["r"]
        time = datetime.datetime.now()

       
        try:
            position = Position(x=x, y=y, z=z,r=r, time=time)
            db.session.add(position)
            db.session.commit()
            return f"Added {str(data)}"
        
        except Exception as e:
            return str(e)
    def get():
        try:
            positions = db.session.query(Position).order_by(Position.id.asc()).all()
            return [position.return_json() for position in positions]
        except Exception as e:
            return str(e)
    def get_last():
        try:
            positions = db.session.query(Position).order_by(Position.id.desc()).first()
            return positions.return_json()
        except Exception as e:
            return str(e)
        
    def move_to(self,x,y,z,r):
        import pydobot
        
        try:
            device = pydobot.Dobot(port='COM5', verbose=True)
            device.move_to(x,y,z,r)
        except Exception as e:
            pass
        self.add({"x":x,"y":y,"z":z,"r":r})
        return "Moved to "+str(x)+","+str(y)+","+str(z)+","+str(r)
        
  