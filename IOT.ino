#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <FirebaseArduino.h>
#define WIFI_SSID "Worapron4_1_2.4G"
#define WIFI_PASSWORD "pp394394"
#define FIREBASE_HOST "final-sarawut-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "AIzaSyBhGLtgVbvM13-g6-081DvmY9jtZoB9QOQ"
#include "DHT.h"
DHT dht;



//ชุดPaht
String BOARD_KEY = "boxs/001";
String connectionPAHT = BOARD_KEY + "/connection";
String foodPAHT = BOARD_KEY + "/food";
String moisturePAHT = BOARD_KEY + "/moisture";
String temperaturePAHT = BOARD_KEY + "/temperature";
String waterPAHT = BOARD_KEY + "/water";


//Valible to firebase
//สำหรับวัดค่าความชื้นในน้ำ
int moistureWaterPin = A0;
int moistureWater = 0;
//สำหรับคลื่นUltrasonic
const int trig = 2;
const int echo = 0;
long duration;
int distance;
//ความชื้นในอากาศ
int moistureAir = 0;
//อุณหภูมิ
int temperature = 0;



void setup()
{
  Serial.begin(115200);

  // connect to wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);

  dht.setup(2); // data pin 2
  pinMode(trig, OUTPUT);
  pinMode(echo, INPUT);
}

void loop()
{

  if (Firebase.failed())
  {
    Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
    Serial.println(Firebase.error());
    Serial.println("Connection to firebase failed...");
  }
  else
  {
    setMoistureWater();
    setMoistureAir();
    setTemperature();
    setFoodVolume();
    delay(2000);
  }
}

void setMoistureWater()
{
  moistureWater = analogRead(moistureWaterPin);  //อ่านค่าสัญญาณ analog ขาA0 ที่ต่อกับ Soil Moisture Sensor Module v1
  Serial.print("val = "); // พิมพ์ข้อมความส่งเข้าคอมพิวเตอร์ "val = "
  Serial.println(moistureWater); // พิมพ์ค่าของตัวแปร val
  delay(2000);
}
void setMoistureAir()
{
  moistureAir = dht.getHumidity(); // ดึงค่าความชื้น
  Serial.print("\t");
  Serial.print(moistureAir, 1);
  delay(2000);
}
void setTemperature()
{
  temperature = dht.getTemperature(); // ดึงค่าอุณหภูมิ
    Serial.print("\t\t");
    Serial.print(temperature, 1);
    delay(2000);
}
void setFoodVolume()
{
  digitalWrite(trig, LOW);
  delayMicroseconds(2);
  digitalWrite(trig, HIGH);
  delayMicroseconds(10);
  digitalWrite(trig, LOW);

  duration = pulseIn(echo, HIGH);
  distance = duration * 0.034 / 2;
  Serial.print(distance);
  Serial.print("cm");
  Serial.println();
  delay(2000);
}
