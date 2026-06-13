import http from "http";
import httpProxy from "http-proxy";

const proxy = httpProxy.createProxyServer({
  target: "http://127.0.0.1:11434",
});

const port = process.env.PORT || 10000;

http.createServer((req, res) => {
  proxy.web(req, res);
}).listen(port, "0.0.0.0", () => {
  console.log(`Proxy listening on ${port}`);
});
