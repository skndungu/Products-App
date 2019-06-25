#include <Arduino.h>

#include <SPI.h>
#include <LoRa.h>

int led = 6;
int led2 = 5;
int smd = 9;
void setup()
{
  Serial.begin(9600);
  pinMode(led2, OUTPUT);
  pinMode(led, OUTPUT);
  pinMode(smd, OUTPUT);
  while (!Serial)
    ;

  Serial.println("LoRa Receiver");

  if (!LoRa.begin(433E6))
  {
    Serial.println("Starting LoRa failed!");
    while (1)
      ;
  }
}

void loop()
{
  // try to parse packet
  int packetSize = LoRa.parsePacket();
  if (packetSize)
  {
    // received a packet
    Serial.print("Received packet '");

    // read packet
    while (LoRa.available())
    {
      Serial.print((char)LoRa.read());
      blink();
    }

    // print RSSI of packet
    Serial.print("' with RSSI ");
    Serial.println(LoRa.packetRssi());
  }
}

void blink()
{
  digitalWrite(led, HIGH);
  digitalWrite(led2, HIGH);
  digitalWrite(smd, HIGH);
  delay(500);
  digitalWrite(led, LOW);
  digitalWrite(led2, LOW);
  digitalWrite(smd, LOW);
  delay(800);
}
