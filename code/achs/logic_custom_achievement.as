[Entity("logic_custom_achievement")]
class CCustomAchievement : CBaseAnimating {
    // this keyvalue causes the game to crash on save reload
    // it won't when removed
    [KeyValue("achievementname", FIELD_STRING)]
    private string achName;

    [Output("OnGranted")]
    COutputEvent onGranted;
    [Output("OnCleared")]
    COutputEvent onCleared;

    [Input("Grant", FIELD_INPUT)]
    void InGrant(const InputData&in data) {
        this.Grant();
    }
    [Input("Clear", FIELD_INPUT)]
    void InClear(const InputData&in data) {
        this.Clear();
    }

    void Grant() {
        Msgl("[ACHIEVEMENTS] Granted achievement '"+achName+"'");
        this.onGranted.Fire(null, this, 0.0f);
    }
    void Clear() {
        Msgl("[ACHIEVEMENTS] Cleared achievement '"+achName+"'");
        this.onCleared.Fire(null, this, 0.0f);
    }
}