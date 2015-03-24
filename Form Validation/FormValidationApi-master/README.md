FormValidationApi
=================

Validates UItextfield in iOS app.

#Installation


- [Download FormValidationApi](https://github.com/haroon-rasheed-confiz/FormValidationApi/archive/master.zip) 
- Drag and drop HrUITextField files in your project.


## Requirements

requires Xcode 5, targeting either iOS 6.0 and above, or Mac OS 10.8 Mountain Lion 


## Usage

- Go to Storyboard or xib and change UITextField Class with HrUITextfield in identity inspector.


#### initialize Textfield ( Example Code )

```objective-c
  -(void)viewDidLoad{
    [super viewDidLoad];
    
    self.textFieldEmail.textType=TextTypeEmailAddress;
    self.textFieldEmail.maxLength=255;
    self.textFieldEmail.isRequired=YES;
    
}
```


#### On TouchUpInside Action

```objective-c

 if ([self.textFieldEmail isValid]) {
        // do something
    }

```

#### Basic constraints

- `isRequire`
- `minLength`
- `maxLength`

#### TextType 

- `TextTypeEmailAddress`
- `TextTypePhoneNo`
- `TextTypeNumbers`
- `TextTypeDigits`

#Contributer

1. Haroon ur Rasheed
2. Usman Ali
