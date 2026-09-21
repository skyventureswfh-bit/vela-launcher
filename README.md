# Vela Launcher

Sky Ventures WI BTC 15-minute launcher workspace based on the upstream Vela project (`routsiddharth/vela`).

## Launcher V1
- BTC 15-minute market only (`KXBTC15M`)
- Real-money mode is explicit in `START_BTC_LIVE.bat`
- $25 daily-loss halt
- $25 absolute open-notional floor/cap logic plus 50% ledger fraction guard inherited from Vela
- File kill switch: `livepaper/data_btc/KILL`
- One-click Windows helpers: `START_BTC_LIVE.bat`, `KILL_VELA.bat`, `RESET_KILL.bat`
- Real Kalshi credentials belong only in local `.env`; never commit them.

## Important
The upstream repository did not expose a LICENSE file in the inspected tree. Keep attribution and do not treat this copy as generally redistributable/open-source until licensing is clarified. Consider making this repository private before using or extending the copied upstream source.

This software can place real-money orders. The $25 daily-loss halt limits strategy-realized daily loss according to the runtime ledger; it is not a guarantee that total account loss can never exceed $25 due to fills, settlement timing, software/network failures, or other account activity.
