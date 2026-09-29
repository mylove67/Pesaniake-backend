import { useState } from "react";

export default function App() {
  const [balance, setBalance] = useState(10000);
  const [trades, setTrades] = useState([]);

  const placeTrade = (type) => {
    const newTrade = {
      type,
      pair: "EUR/USD",
      price: "1.17450",
      amount: 100,
      time: new Date().toLocaleTimeString(),
    };

    setTrades([newTrade, ...trades]);
    setBalance(balance - 100);
  };

  return (
    <div
      style={{
        minHeight: "100vh",
        background: "#0b1120",
        color: "white",
        padding: "20px",
        fontFamily: "Arial",
      }}
    >
      <h1>DemoMarket</h1>
      <p>Professional Demo Trading Platform</p>

      <div
        style={{
          background: "#172033",
          padding: "20px",
          borderRadius: "12px",
          marginBottom: "20px",
        }}
      >
        <h2>Demo Balance</h2>
        <h1>${balance.toFixed(2)}</h1>
      </div>

      <div
        style={{
          background: "#172033",
          padding: "20px",
          borderRadius: "12px",
          marginBottom: "20px",
        }}
      >
        <h2>EUR/USD</h2>
        <h1>1.17450</h1>
        <p>Demo Market Price</p>

        <button
          onClick={() => placeTrade("BUY")}
          style={{
            padding: "15px 30px",
            marginRight: "10px",
            background: "green",
            color: "white",
            border: "none",
            borderRadius: "8px",
          }}
        >
          BUY
        </button>

        <button
          onClick={() => placeTrade("SELL")}
          style={{
            padding: "15px 30px",
            background: "red",
            color: "white",
            border: "none",
            borderRadius: "8px",
          }}
        >
          SELL
        </button>
      </div>

      <div
        style={{
          background: "#172033",
          padding: "20px",
          borderRadius: "12px",
        }}
      >
        <h2>Trade History</h2>

        {trades.length === 0 ? (
          <p>No trades yet.</p>
        ) : (
          trades.map((trade, index) => (
            <div
              key={index}
              style={{
                padding: "12px",
                borderBottom: "1px solid #334155",
              }}
            >
              <strong>{trade.type}</strong> — {trade.pair}
              <br />
              Price: {trade.price}
              <br />
              Amount: ${trade.amount}
              <br />
              Time: {trade.time}
            </div>
          ))
        )}
      </div>
    </div>
  );
}
