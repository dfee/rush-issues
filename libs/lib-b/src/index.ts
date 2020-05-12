import { DateTime } from "luxon";

import { wrap } from "@rush-issues/lib-a";

export const highlightNow = () => wrap(DateTime.utc().toString());
