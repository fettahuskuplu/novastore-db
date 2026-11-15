-- Bölüm 1: Veri Tabanı Tasarımı (DDL)

CREATE DATABASE NovaStoreDB;
GO

USE NovaStoreDB;
GO

-- A. Categories Tablosu
CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

-- C. Customers Tablosu
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(50),
    City VARCHAR(20),
    Email VARCHAR(100) UNIQUE
);

-- B. Products Tablosu
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2),
    Stock INT DEFAULT 0,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID)
);

-- D. Orders Tablosu
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2)
);

-- E. OrderDetails Tablosu
CREATE TABLE OrderDetails (
    DetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT
);
GO

-- Bölüm 2: Veri Girişi (DML)

-- Görev 1: Kategoriler
INSERT INTO Categories (CategoryName) VALUES
('Elektronik'),
('Giyim'),
('Kitap'),
('Kozmetik'),
('Ev ve Yaşam');

-- Görev 2: Ürünler
INSERT INTO Products (ProductName, Price, Stock, CategoryID) VALUES
('Kablosuz Kulaklık', 1250.00, 15, 1),
('Mekanik Klavye', 2400.00, 8, 1),
('Taşınabilir Şarj Cihazı', 850.00, 35, 1),
('Pamuklu Oversize Tişört', 450.00, 50, 2),
('Su Geçirmez Outdoor Mont', 3200.00, 12, 2),
('Kot Pantolon', 1100.00, 25, 2),
('Temiz Kod (Clean Code)', 380.00, 18, 3),
('Veri Tabanı Yönetim Sistemleri', 420.00, 40, 3),
('Nemlendirici Yüz Kremi', 600.00, 10, 4),
('Güneş Koruyucu Losyon', 750.00, 30, 4),
('Filtre Kahve Makinesi', 2800.00, 5, 5),
('Bambu Kesme Tahtası Seti', 550.00, 22, 5);

-- Görev 3: Müşteriler
INSERT INTO Customers (FullName, City, Email) VALUES
('Ahmet Yılmaz', 'İstanbul', 'ahmet.yilmaz@email.com'),
('Ayşe Demir', 'Ankara', 'ayse.demir@email.com'),
('Mehmet Kaya', 'İzmir', 'mehmet.kaya@email.com'),
('Zeynep Çelik', 'Bursa', 'zeynep.celik@email.com'),
('Caner Şahin', 'Antalya', 'caner.sahin@email.com'),
('Elif Arslan', 'Eskişehir', 'elif.arslan@email.com');

-- Görev 4: Siparişler ve Sipariş Detayları
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2026-09-15 10:30:00', 2010.00),
(2, '2026-09-20 14:15:00', 3800.00),
(3, '2026-10-02 09:45:00', 2400.00),
(1, '2026-10-10 16:20:00', 3700.00),
(4, '2026-10-18 11:00:00', 1920.00),
(5, '2026-10-25 19:10:00', 3050.00),
(2, '2026-11-01 13:40:00', 550.00),
(6, '2026-11-05 15:50:00', 2450.00),
(3, '2026-11-08 18:05:00', 420.00),
(1, '2026-11-10 21:00:00', 750.00);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(1, 7, 2),
(2, 5, 1),
(2, 9, 1),
(3, 2, 1),
(4, 11, 1),
(4, 4, 2),
(5, 10, 2),
(5, 8, 1),
(6, 6, 2),
(6, 3, 1),
(7, 12, 1),
(8, 1, 1),
(8, 9, 2),
(9, 8, 1),
(10, 10, 1);
GO
