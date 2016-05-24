.class public abstract Lcom/facebook/TokenCachingStrategy;
.super Ljava/lang/Object;
.source "TokenCachingStrategy.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getDate(Landroid/os/Bundle;Ljava/lang/String;)Ljava/util/Date;
    .registers 8
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const-wide/high16 v4, -0x8000000000000000L

    const/4 v2, 0x0

    .line 394
    if-nez p0, :cond_6

    .line 403
    :cond_5
    :goto_5
    return-object v2

    .line 398
    :cond_6
    invoke-virtual {p0, p1, v4, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 399
    .local v0, "n":J
    cmp-long v3, v0, v4

    if-eqz v3, :cond_5

    .line 403
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, v0, v1}, Ljava/util/Date;-><init>(J)V

    goto :goto_5
.end method

.method public static getSource(Landroid/os/Bundle;)Lcom/facebook/AccessTokenSource;
    .registers 3
    .param p0, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 310
    const-string v1, "bundle"

    invoke-static {p0, v1}, Lcom/facebook/internal/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 311
    const-string v1, "com.facebook.TokenCachingStrategy.AccessTokenSource"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 312
    const-string v1, "com.facebook.TokenCachingStrategy.AccessTokenSource"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/facebook/AccessTokenSource;

    .line 315
    :goto_15
    return-object v1

    .line 314
    :cond_16
    const-string v1, "com.facebook.TokenCachingStrategy.IsSSO"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 315
    .local v0, "isSSO":Z
    if-eqz v0, :cond_21

    sget-object v1, Lcom/facebook/AccessTokenSource;->FACEBOOK_APPLICATION_WEB:Lcom/facebook/AccessTokenSource;

    goto :goto_15

    :cond_21
    sget-object v1, Lcom/facebook/AccessTokenSource;->WEB_VIEW:Lcom/facebook/AccessTokenSource;

    goto :goto_15
.end method

.method public static hasTokenInformation(Landroid/os/Bundle;)Z
    .registers 9
    .param p0, "bundle"    # Landroid/os/Bundle;

    .prologue
    const-wide/16 v6, 0x0

    const/4 v3, 0x0

    .line 129
    if-nez p0, :cond_6

    .line 143
    :cond_5
    :goto_5
    return v3

    .line 133
    :cond_6
    const-string v4, "com.facebook.TokenCachingStrategy.Token"

    invoke-virtual {p0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 134
    .local v2, "token":Ljava/lang/String;
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_5

    .line 138
    const-string v4, "com.facebook.TokenCachingStrategy.ExpirationDate"

    invoke-virtual {p0, v4, v6, v7}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 139
    .local v0, "expiresMilliseconds":J
    cmp-long v4, v0, v6

    if-eqz v4, :cond_5

    .line 143
    const/4 v3, 0x1

    goto :goto_5
.end method

.method static putDate(Landroid/os/Bundle;Ljava/lang/String;Ljava/util/Date;)V
    .registers 5
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "date"    # Ljava/util/Date;

    .prologue
    .line 407
    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 408
    return-void
.end method


# virtual methods
.method public abstract clear()V
.end method

.method public abstract load()Landroid/os/Bundle;
.end method

.method public abstract save(Landroid/os/Bundle;)V
.end method
