
This project is just used for validating the ability and usage trick of JSONModel framework.

See details info in code in Class and Class/JModelEntity groups.


Conclusion:
When you try to deserialize an object from json/dictionary object to an objective-c class object, all the non-optional properties in the destination class should be displayed in source objects, that is, the destination class non-optional property list should be a subset of the source object, BUT NOT VICE VERSA. Or you will get the following error messages.

Use objective-c's Category attribute to expand the destination class? No way! Category attribute for a class is not really an expanded class structure in runtime, all the propertities will be included in one class, so, following the above conclusion, you could NOT expand the destination class with Category BUT inheritance.

Just use category Optional or Ignore to fix it, that works but not pretty good as you will assign a new "type" value to the property.

------------------------------------------ ERROR 1 ---------------------------------------------------------
2014-10-16 19:25:57.695 JSONModel_Demo[30025:2683734] [JSONModel.m:252] Incoming data was invalid [JModelSchool initWithDictionary:]. Keys missing: {(
Province
)}
2014-10-16 19:25:57.695 JSONModel_Demo[30025:2683734] error: Error Domain=JSONModelErrorDomain Code=1 "Invalid JSON data. Required JSON keys are missing from the input. Check the error user information." UserInfo=0x7fb6c42122d0 {kJSONModelMissingKeys=(
Province
), NSLocalizedDescription=Invalid JSON data. Required JSON keys are missing from the input. Check the error user information.}

------------------------------------------ ERROR 2 ---------------------------------------------------------
Error Domain=JSONModelErrorDomain Code=1 "Invalid JSON data: Value of required model key Interests is null" UserInfo=0x7fc7a851b540 {NSLocalizedDescription=Invalid JSON data: Value of required model key Interests is null, kJSONModelKeyPath=Interests}
------------------------------------------------------------------------------------------------------------