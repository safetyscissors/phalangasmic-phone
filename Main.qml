import QtQuick 2.0
import Ubuntu.Components 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {

    function loginStbx(){
        var xmlhttp = new XMLHttpRequest()
        var user = stbxusername.text
        var pass = stbxpassword.text

        var url = "https://www.starbucks.com/account/signin?ReturnUrl=/account/home"
        xmlhttp.onreadystatechange=function() {
           if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
               myFunction(xmlhttp.responseText);
           }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    function myFunction(data){
        textbody.text = data
    }

    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "tryfour.safetyscissors"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(100)
    height: units.gu(75)

    Page {
        id: page1
        title: i18n.tr("STBX")

        Column {
            id: column1
            anchors.fill: parent
            spacing: units.gu(1)
            anchors {
                margins: units.gu(2)
            }

            Label {
                id: label
                objectName: "label"

                text: i18n.tr("Hello..")
            }

            TextField {
                id: stbxusername

                width:  parent.width
                text:"itoandrew"
                anchors.top: parent.top
                anchors.topMargin: 25
                placeholderText: qsTr("Text Input")
                transformOrigin: Item.Bottom

            }

            TextField {
                id: stbxpassword
                anchors.top: parent.top
                anchors.topMargin: 75
                width: parent.width
                text:"Iamai#13"
                placeholderText: qsTr("Text Input")
                echoMode: TextInput.PasswordEchoOnEdit
            }




            Button {
                objectName: "button"
                width: parent.width
                anchors.top: parent.top
                anchors.topMargin: 130
                text: i18n.tr("Login")

                onClicked: loginStbx()
            }

            Text {
                id: textbody
                text: qsTr("")
                font.pixelSize: 12
            }

            Image {
                id: image1
                width:parent.width
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 50
                source: "code.png"
            }
        }

    }
}
