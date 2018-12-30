import QtQuick 2.0
import "NotifyMenu.js" as NotifyMenu

Item {
    property string standardcolor
    property string switchedcolor
    property string mousecontainscolor
    property string fontFamily: "Agency FB"
    antialiasing: true

    signal buttonClicked(var buttonState)
    signal connectionChanged(var connectionState)  //send this to backend
    signal notifyChange(var notifyState)

    Rectangle {
        id: topBar
        width: parent.width*0.92
        height: parent.height*0.139
        color: "#2F3243"
        anchors {
        top: parent.top
        right:parent.right
        }
        Text{
            id: timeObj
            font.family: fontFamily
            color: "#F1F1F1"
            font {
                pointSize: (parent.height*0.2).toFixed(0)
                bold: true
            }

            anchors {
                verticalCenter: parent.verticalCenter
                verticalCenterOffset: -parent.height*0.025
                right: notifyBell.right
                rightMargin: parent.width*0.05
            }
            Timer{
                id: timeTimer
                interval: 100
                repeat: true
                running: true
                triggeredOnStart: true
                onTriggered: timeObj.text=new Date().toLocaleString(Qt.locale(),"hh:mm")
            }
        }
        Text{
            id: dateObj
            color: "#F1F1F1"
            font.family: fontFamily
            text: new Date().toLocaleString(Qt.locale(),"dd.MM.yyyy")
            font {
                pointSize: (parent.height*0.1).toFixed(0)
                bold: true
            }

            anchors {
                verticalCenter: parent.verticalCenter
                verticalCenterOffset: -parent.height*0.025
                top: timeObj.bottom
                rightMargin: parent.width*0.02
                left: timeObj.left
            }
            Timer{
                id: dateTimer
                interval: 100
                repeat: true
                running: true
                triggeredOnStart: true
                onTriggered: dateObj.text=new Date().toLocaleString(Qt.locale(),"dd.MM.yyyy")
            }
        }
        Image { //connectButton
             id: connectionSlider
             source: "qrc:/assetsMenu/START BUTTON.png"
             width: parent.width*0.1
             height: parent.height*0.3
             anchors {
                 right: dateObj.right
                 rightMargin: parent.width*0.05
                 verticalCenter: parent.verticalCenter
             }
             MouseArea {
                 anchors.fill: parent
                 hoverEnabled: true
                 onClicked: {
                    if(parent.source=="qrc:/assetsMenu/START BUTTON.png"){
                        connectionChanged(true);
                        parent.source="qrc:/assetsMenu/STOP BUTTON.png"
                    }
                    else {
                       parent.source="qrc:/assetsMenu/START BUTTON.png";
                       connectionChanged(false);
                    }
                 }
             }

        }
        Image {
            id: notifyBell
            source: "qrc:/assetsMenu/NOTIFY BELL.png"
            property bool menu
            property bool notify: false
            property var menuObj: undefined
            anchors {
                right: parent.right
                rightMargin: parent.width*0.1
                verticalCenter: parent.verticalCenter
            }
            height: parent.height*0.5
            width: parent.width*0.04
            MouseArea {
                anchors.fill: notifyBell
                onClicked: {
                    if(parent.menuObj==undefined){
                        parent.menu==true;
                        NotifyMenu.createMenu();

                    }
                    else {
                        NotifyMenu.deleteMenu();
                        parent.menu=false;
                        parent.menuObj=undefined;
                        console.log("MenuDelete")
                    }
                }

            }
        }

//        SliderSwitch {

//            size: parent.height*0.4
//            offstatecolor: "#424D5C"
//            onstatecolor: "#009688"
//            anchors {
//                right: parent.right
//                rightMargin: parent.width*0.05
//                verticalCenter: parent.verticalCenter
//            }
//            onStateChanged: {
//                if(connectionSlider.state == "on"){connectionChanged(true)}
//                else {connectionChanged(false)}
//            }
//        }

        Image {
            source: "qrc:/assetsMenu/AGHSOLARLOGO.png"
            height: 0.78*parent.height
            width: 0.096*parent.width
            anchors {
                left: parent.left
                leftMargin: 0.096*parent.width*0.25
                verticalCenter: parent.verticalCenter
            }
        }

    }
    Rectangle {
        id: sideBar
        width: parent.width*0.08
        height: parent.height
        color: "#2F3243"
            anchors {
                top: parent.top
                left: parent.left
                    }
            Rectangle {
                id: planeGroupRect
                width: parent.width*0.944
                height: parent.height*0.12
                color: standardcolor
                radius: 5
                    border {
                        width: parent.height*0.0034
                        color: "#2F3243"
                    }

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.top
                        topMargin: parent.height*0.0034
                    }
                Image {
                    source: "qrc:/assetsMenu/planeLogo.png"
                    height: 0.71*parent.height
                    width: 0.66*parent.width
                    anchors {
                        centerIn: parent
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.color = mousecontainscolor
                    }
                    onExited: {
                        parent.color = standardcolor
                    }
                    onClicked: {
                        buttonClicked("home");
                    }

                }
            }
            Rectangle {
                id: homeGroupRect
                width: parent.width*0.944
                height: parent.height*0.12
                color: standardcolor
                radius: 5
                     border {
                        width: parent.height*0.0034
                        color: "#2F3243"
                            }
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: planeGroupRect.bottom
                        topMargin: parent.height*0.0034
                    }
                    Image {
                        source: "qrc:/assetsMenu/homePageIcon.png"
                        height: 0.342*parent.height
                        width: 0.32*parent.width
                        anchors {
                            centerIn: parent
                        }
            }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.color = mousecontainscolor
                        }
                        onExited: {
                            parent.color = standardcolor
                        }
                        onClicked: {
                            buttonClicked("home");
                        }

                    }
            }
            Rectangle {
                id: parametersGroupRect
                width: parent.width*0.944
                height: parent.height*0.12
                color: standardcolor
                radius: 5
                     border {
                        width: parent.height*0.0034
                        color: "#2F3243"
                            }
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: homeGroupRect.bottom
                        topMargin: parent.height*0.0034
                    }
                    Image {
                        source: "qrc:/assetsMenu/parametersIcon.png"
                        height: 0.342*parent.height
                        width: 0.32*parent.width
                        anchors {
                            centerIn: parent
                        }
            }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.color = mousecontainscolor
                        }
                        onExited: {
                            parent.color = standardcolor
                        }
                        onClicked: {
                            buttonClicked("parameters");
                        }

                    }
            }
            Rectangle {
                id: historicalDataRect
                width: parent.width*0.944
                height: parent.height*0.12
                color: standardcolor
                radius: 5
                     border {
                        width: parent.height*0.0034
                        color: "#2F3243"
                            }
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parametersGroupRect.bottom
                        topMargin: parent.height*0.0034
                    }
                    Image {
                        source: "qrc:/assetsMenu/historyIcon.png"
                        height: 0.342*parent.height
                        width: 0.32*parent.width
                        anchors {
                            centerIn: parent
                        }
            }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.color = mousecontainscolor
                        }
                        onExited: {
                            parent.color = standardcolor
                        }
                        onClicked: {
                            buttonClicked("historical");
                        }

                    }
            }
            Rectangle {
                id: settingsRect
                width: parent.width*0.944
                height: parent.height*0.12
                color: standardcolor
                radius: 5

                     border {
                        width: parent.height*0.0034
                        color: "#2F3243"
                            }
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: historicalDataRect.bottom
                        topMargin: parent.height*0.0034
                    }
                    Image {
                        source: "qrc:/assetsMenu/settingsIcon.png"
                        height: 0.342*parent.height
                        width: 0.32*parent.width
                        anchors {
                            centerIn: parent
                        }
            }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.color = mousecontainscolor
                        }
                        onExited: {
                            parent.color = standardcolor
                        }
                        onClicked: {
                            buttonClicked("settings");
                        }

                    }
            }

    }


}
