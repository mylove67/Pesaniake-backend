import { useState } from "react";

export default function App() {
  const [balance, setBalance] = useState(10000);
  const [trades, setTrades] = useState([]);

  function placeTrade(type) {
    const trade = {
      type,
      pair: "EUR/USD",
      price: "1.17450",
      amount: 100,
      time: new Date().toLocaleTimeString(),
    };

    setTrades((oldTrades) => [trade, ...oldTrades]);
    setBalance((oldBalance) => oldBalance - 100);
  }

  return (
    <main
      style={{
        minHeight: "100vh",
        background: "#0b1120",
        color: "white",
        padding: "24px",
        fontFamily: "Arial, sans-serif",
      }}
    >
      <h1>DemoMarket</h1>
      <p>Demo Trading Platform</p>

      <section
        style={{
          background: "#172033",
          padding: "20px",
          borderRadius: "14px",
          marginBottom: "20px",
        }}
      >
        <p>Demo Balance</p>
        <h2>${balance.toFixed(2)}</h2>
      </section>

      <section
        style={{
          background: "#172033",
          padding: "20px",
          borderRadius: "14px",
          marginBottom: "20px",
        }}
      >
        <h2>EUR/USD</h2>
        <h1>1.17450</h1>
        <p>Demo Market Price</p>

        <button onClick={() => placeTrade("BUY")}>
          BUY
        </button>

        <button onClick={() => placeTrade("SELL")}>
          SELL
        </button>
      </section>

      <section
        style={{
          background: "#172033",
          padding: "20px",
          borderRadius: "14px",
        }}
      >
        <h2>Trade History</h2>

        {trades.length === 0 ? (
          <p>No trades yet.</p>
        ) : (
          trades.map((trade, index) => (
            <p key={index}>
              {trade.type} — {trade.pair} — ${trade.amount} — {trade.time}
            </p>
          ))
        )}
      </section>
    </main>
  );
      }
