import Koa from "koa";

import { highlightNow } from "@rush-issues/lib-b";

const app = new Koa().use(async (ctx: Koa.Context) => {
  ctx.body = `Service B: ${highlightNow()}`;
});

app.listen(3000);
