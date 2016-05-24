.class Lit/sephiroth/android/library/ab/ABSharedPreference;
.super Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;
.source "ABSharedPreference.java"


# instance fields
.field private final uuid:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 14
    invoke-direct {p0}, Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;-><init>()V

    .line 15
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/ab/ABSharedPreference;->generate(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/ab/ABSharedPreference;->uuid:Ljava/lang/String;

    .line 16
    return-void
.end method

.method private generate(Landroid/content/Context;)Ljava/lang/String;
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/ab/ABSharedPreference;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 23
    .local v1, "prefs":Landroid/content/SharedPreferences;
    const-string v4, "ab-uuid"

    invoke-interface {v1, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_17

    .line 24
    const-string v4, "ab-uuid"

    const/4 v5, 0x0

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 25
    .local v2, "string":Ljava/lang/String;
    if-eqz v2, :cond_17

    move-object v3, v2

    .line 35
    .end local v2    # "string":Ljava/lang/String;
    .local v3, "string":Ljava/lang/String;
    :goto_16
    return-object v3

    .line 30
    .end local v3    # "string":Ljava/lang/String;
    :cond_17
    invoke-virtual {p0}, Lit/sephiroth/android/library/ab/ABSharedPreference;->generateNew()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    .line 31
    .restart local v2    # "string":Ljava/lang/String;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 32
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v4, "ab-uuid"

    invoke-interface {v0, v4, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 33
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-object v3, v2

    .line 35
    .end local v2    # "string":Ljava/lang/String;
    .restart local v3    # "string":Ljava/lang/String;
    goto :goto_16
.end method

.method private getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_b

    .line 40
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/ab/ABSharedPreference;->getSharedPreferencesNewApi(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 42
    :goto_a
    return-object v0

    :cond_b
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/ab/ABSharedPreference;->getSharedPreferencesOldApi(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    goto :goto_a
.end method

.method private getSharedPreferencesNewApi(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 48
    const-string v0, "alphabeta"

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method private getSharedPreferencesOldApi(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 52
    const-string v0, "alphabeta"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getUUID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lit/sephiroth/android/library/ab/ABSharedPreference;->uuid:Ljava/lang/String;

    return-object v0
.end method
