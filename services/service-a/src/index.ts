import Koa from "koa";

import { wrap } from "@rush-issues/lib-a";

const app = new Koa().use(async (ctx: Koa.Context) => {
  ctx.body = wrap("Service A");
});

app.listen(3000);
