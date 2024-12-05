import Debug "mo:base/Debug";
// import Nat "mo:base/Nat";
import Float "mo:base/Float";
import Time "mo:base/Time";

actor DBank {
  stable var currentValue : Float = 1221;
  // currentValue := 2112;  
  // Debug.print("Hello");
  //Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));
    // startTime := Time.now();


  public func topUp(amount:Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount:Float){
    let tempValue : Float = currentValue - amount;

    if(tempValue >= 0 ){
       currentValue -= amount;
       Debug.print(debug_show(currentValue));
    }else{
    Debug.print("amount too large, currentValue is less than zero");
    }  
  };

  public query func checkBalance() : async Float{
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeLapsedNS = currentTime - startTime;
    let timeElapseds = timeLapsedNS / 100000000;
    currentValue := currentValue * (0.5 ** Float.fromInt(timeElapseds));  
    startTime := currentTime;
  };

}