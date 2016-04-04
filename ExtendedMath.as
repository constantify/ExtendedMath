package {
	
	
	public final class ExtendedMath {
		
		// For a start, we're mapping the native AS3 Math public constants
		// A mathematical constant for the base of natural logarithms, expressed as e.
		public static const E:Number = Math.E;
		// A mathematical constant for the natural logarithm of 10, expressed as loge10, with an approximate value of 2.302585092994046.
		public static const LN10:Number = Math.LN10;
		// A mathematical constant for the natural logarithm of 2, expressed as loge2, with an approximate value of 0.6931471805599453.
		public static const LN2:Number = Math.LN2;
		// A mathematical constant for the base-10 logarithm of the constant e (Math.E), expressed as log10e, with an approximate value of 0.4342944819032518.
		public static const LOG10E:Number = Math.LOG10E;
		// A mathematical constant for the base-2 logarithm of the constant e, expressed as log2e, with an approximate value of 1.442695040888963387.
		public static const LOG2E:Number = Math.LOG2E;
		// A mathematical constant for the ratio of the circumference of a circle to its diameter, expressed as pi, with a value of 3.141592653589793.
		public static const PI:Number = Math.PI;
		// A mathematical constant for the square root of one-half, with an approximate value of 0.7071067811865476.
		public static const SQRT1_2:Number = Math.SQRT1_2;
		// A mathematical constant for the square root of 2, with an approximate value of 1.4142135623730951.
		public static const SQRT2:Number = Math.SQRT2;
		//////////////////////
		/*     NEW STUFF    */
		//////////////////////		
		// Degrees-to-radians conversion constant 
		public static const DEG2RAD:Number = (PI * 2)/360;
		// Radians-to-degrees conversion constant
		public static const RAD2DEG:Number = 360/(PI * 2);
		// The smallest value that a float can have different from zero.
		public static const EPSILON:Number = Number.MIN_VALUE;
		// A representation of positive infinity.
		public static const INFINITY:Number = Number.POSITIVE_INFINITY;
		// A representation of negative infinity.
		public static const NEGATIVE_INFINITY:Number = Number.NEGATIVE_INFINITY;
		
		
		// We're mapping native AS3 Math metods		
		// Computes and returns an absolute value for the number specified by the parameter val.
		public static function abs(val:Number):Number { return Math.abs(val); }	
		// Computes and returns the arc cosine of the specified angle in radians.
		public static function acos(angleRadians:Number):Number { return Math.acos(angleRadians); }
		// Computes and returns the arc sine of the specified angle in radians.
		public static function asin(angleRadians:Number):Number { return Math.asin(angleRadians); }			
		// Computes and returns the value, in radians, of the angle whose tangent is specified in the parameter val.
		public static function atan(angleRadians:Number):Number { return Math.atan(angleRadians); }	
		// Computes and returns the angle of the point y/x in radians, when measured counterclockwise from a circle's x axis (where 0,0 represents the center of the circle).
		public static function atan2(y:Number, x:Number):Number { return Math.atan2(y,x); }	
		// Returns the ceiling of the specified number or expression.
		public static function ceil(val:Number):int { return Math.ceil(val); }	
		// Computes and returns the cosine of the specified angle in radians.
		public static function cos(angleRadians:Number):Number { return Math.cos(angleRadians); }	
		// Returns the value of the base of the natural logarithm (e), to the power of the exponent specified in the parameter x.
		public static function exp(val:Number):Number { return Math.exp(val); }
		// Returns the floor of the number or expression specified in the parameter val.
		public static function floor(val:Number):int { return Math.floor(val); }
		// Returns the natural logarithm of the parameter val.
		public static function log(val:Number):Number { return Math.log(val); }
		// Evaluates one or more values and returns the largest value.
		public static function max(...params):Number { return Math.max.apply(null, params); }
		// Evaluates one or more values and returns the smallest value.
		public static function min(...params):Number { return Math.min.apply(null, params); }
		// Computes and returns base to the power of pow.
		public static function pow(base:Number, pow:Number):Number { return Math.pow(base,pow); }
		// Returns a pseudo-random number n, where 0 <= n < 1.
		public static function random():Number { return Math.random(); }
		// Rounds the value of the parameter val up or down to the nearest integer and returns the value.
		public static function round(val:Number):int { return Math.round(val); }		
		// Computes and returns the sine of the specified angle in radians.
		public static function sin(angleRadians:Number):Number { return Math.sin(angleRadians); }
		// Computes and returns the square root of the specified number.
		public static function sqrt(val:Number):Number { return Math.sqrt(val); }
		// Computes and returns the tangent of the specified angle			
		public static function tan(angleRadians:Number):Number { return Math.tan(angleRadians); }				
		//////////////////////
		/*     NEW STUFF    */
		//////////////////////
		// Compares two floating point values if they are similar.
		public static function approximately(val1:Number, val2:Number):Boolean { 
			return abs(val1 - val2) < EPSILON; 
		}
		// Clamps a value between a minimum float and maximum float value.
		public static function clamp(val:Number, min:Number, max:Number):Number { 
			return (val < min)? min : (val > max)? max : val; 
		}
		// Clamps value between 0 and 1 and returns value.
		public static function clamp01(val:Number):Number { 
			return clamp(val,0,1); 
		}
		// Linearly interpolates between a and b by t.
		public static function lerp(val1:Number, val2:Number, t:Number):Number { 
			t = clamp01(t);
			return lerpUnclamped(val1,val2,t);
		}	
		// Linearly interpolates between a and b by t without clamping.
		public static function lerpUnclamped(val1:Number, val2:Number, t:Number):Number { 
			return val1 * (1 - t) + val2 * t;
		}
		// Linearly interpolates between a and b by t (inverse).
		public static function inverseLerp(val1:Number, val2:Number, t:Number):Number { 
			// tbi
		}
		// Moves a value current towards target.
		public static function moveTowards(current:Number, target:Number, maxDelta:Number):Number {
			var delta:Number = target - current;
			return (maxDelta >= delta) ? target : current + maxDelta;
		}
		// Gradually changes a value towards a desired goal over time.
		public static function smoothDamp(current:Number, target:Number, currentVelocity:Number, smoothTime:Number, maxSpeed:Number = INFINITY, deltaTime:Number=0):Number {
			if(deltaTime == 0) {
				deltaTime = Time.deltaTime;
			}
			smoothTime = max(0.0001, smoothTime);
			var omega:Number = 2 / smoothTime;
			var x:Number = omega * deltaTime;
			var exp:Number = 1 / (1 + x + 0.48 * x * x + 0.235 * x * x * x);
			var deltaX:Number = target - current;
			var maxDelta = maxSpeed * smoothTime;
			
			// ensure we do not exceed our max speed
			deltaX = clamp(deltaX, -maxDelta, maxDelta);
			var temp:Number = (currentVelocity + omega * deltaX) * deltaTime;
			var result:Number = current - deltaX + (deltaX + temp) * exp;
			currentVelocity = (currentVelocity - omega * temp) * exp;
			
			// ensure that we do not overshoot our target
			if ((target - current > 0) == (result > target)) {
				result = target;
				currentVelocity = 0;
			}
			return result;
		}		
		// Calculates the shortest difference between two given angles given in degrees.
		public static function deltaAngle(angle1:Number, angle2:Number):Number {			
			  var currRotation:Number = angle1;
			  var newCourse:Number = angle2;
			  var deltaAngle:int = (180/Math.PI) * Math.atan2((Math.cos(currRotation * Math.PI/180) * Math.sin(newCourse * Math.PI/180) - Math.sin(currRotation * Math.PI/180) * Math.cos(newCourse * Math.PI/180)), (Math.sin(currRotation * Math.PI/180) * Math.sin(newCourse * Math.PI/180) + Math.cos(currRotation * Math.PI/180) * Math.cos(newCourse * Math.PI/180)));
			  return deltaAngle;
		}		
		// Calculates the shortest difference between two given angles given in radians.
		public static function deltaAngleRad(angle1:Number, angle2:Number):Number {			
			return deg2rad(deltaAngle(angle1,angle2));
		}
		// Convert degrees to radians
		public static function deg2rad(val:Number):Number {
			return val * PI / 180;
		}
		// Convert radians to degrees
		public static function rad2deg(val:Number):Number {
			return val * 180 / PI;
		}
		// Returns the closest power of two value.
		public static function closestPowerOfTwo(val:Number):int {
			return pow( 2, ( log(val) / log(2) ) << 0 );			
		}
		// 	Returns true if the value is power of two.
		public static function isPowerOfTwo(val:Number):Boolean {
			//return (closestPowerOfTwo(val) == val) ? true : false;	
			return (val>0) ? ((val & -val) == val) : false;
		}
	}
	
}