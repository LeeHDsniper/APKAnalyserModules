.class public final Lcom/facebook/AccessToken;
.super Ljava/lang/Object;
.source "AccessToken.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/AccessToken$SerializationProxyV2;
    }
.end annotation


# static fields
.field private static final ALREADY_EXPIRED_EXPIRATION_TIME:Ljava/util/Date;

.field private static final DEFAULT_ACCESS_TOKEN_SOURCE:Lcom/facebook/AccessTokenSource;

.field private static final DEFAULT_EXPIRATION_TIME:Ljava/util/Date;

.field private static final DEFAULT_LAST_REFRESH_TIME:Ljava/util/Date;

.field private static final MAX_DATE:Ljava/util/Date;

.field private static final MIN_DATE:Ljava/util/Date;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final declinedPermissions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final expires:Ljava/util/Date;

.field private final lastRefresh:Ljava/util/Date;

.field private final permissions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final source:Lcom/facebook/AccessTokenSource;

.field private final token:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 46
    new-instance v0, Ljava/util/Date;

    const-wide/high16 v2, -0x8000000000000000L

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    sput-object v0, Lcom/facebook/AccessToken;->MIN_DATE:Ljava/util/Date;

    .line 47
    new-instance v0, Ljava/util/Date;

    const-wide v2, 0x7fffffffffffffffL

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    sput-object v0, Lcom/facebook/AccessToken;->MAX_DATE:Ljava/util/Date;

    .line 48
    sget-object v0, Lcom/facebook/AccessToken;->MAX_DATE:Ljava/util/Date;

    sput-object v0, Lcom/facebook/AccessToken;->DEFAULT_EXPIRATION_TIME:Ljava/util/Date;

    .line 49
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    sput-object v0, Lcom/facebook/AccessToken;->DEFAULT_LAST_REFRESH_TIME:Ljava/util/Date;

    .line 50
    sget-object v0, Lcom/facebook/AccessTokenSource;->FACEBOOK_APPLICATION_WEB:Lcom/facebook/AccessTokenSource;

    sput-object v0, Lcom/facebook/AccessToken;->DEFAULT_ACCESS_TOKEN_SOURCE:Lcom/facebook/AccessTokenSource;

    .line 51
    sget-object v0, Lcom/facebook/AccessToken;->MIN_DATE:Ljava/util/Date;

    sput-object v0, Lcom/facebook/AccessToken;->ALREADY_EXPIRED_EXPIRATION_TIME:Ljava/util/Date;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/List;Ljava/util/List;Lcom/facebook/AccessTokenSource;Ljava/util/Date;)V
    .registers 8
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "expires"    # Ljava/util/Date;
    .param p5, "source"    # Lcom/facebook/AccessTokenSource;
    .param p6, "lastRefresh"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Date;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/facebook/AccessTokenSource;",
            "Ljava/util/Date;",
            ")V"
        }
    .end annotation

    .prologue
    .line 60
    .local p3, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "declinedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    if-nez p3, :cond_9

    .line 62
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p3

    .line 64
    :cond_9
    if-nez p4, :cond_f

    .line 65
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p4

    .line 68
    :cond_f
    iput-object p2, p0, Lcom/facebook/AccessToken;->expires:Ljava/util/Date;

    .line 69
    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/AccessToken;->permissions:Ljava/util/List;

    .line 70
    invoke-static {p4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/AccessToken;->declinedPermissions:Ljava/util/List;

    .line 71
    iput-object p1, p0, Lcom/facebook/AccessToken;->token:Ljava/lang/String;

    .line 72
    iput-object p5, p0, Lcom/facebook/AccessToken;->source:Lcom/facebook/AccessTokenSource;

    .line 73
    iput-object p6, p0, Lcom/facebook/AccessToken;->lastRefresh:Ljava/util/Date;

    .line 74
    return-void
.end method

.method private appendPermissions(Ljava/lang/StringBuilder;)V
    .registers 4
    .param p1, "builder"    # Ljava/lang/StringBuilder;

    .prologue
    .line 333
    const-string v0, " permissions:"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    iget-object v0, p0, Lcom/facebook/AccessToken;->permissions:Ljava/util/List;

    if-nez v0, :cond_f

    .line 335
    const-string v0, "null"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    :goto_e
    return-void

    .line 337
    :cond_f
    const-string v0, "["

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    const-string v0, ", "

    iget-object v1, p0, Lcom/facebook/AccessToken;->permissions:Ljava/util/List;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    const-string v0, "]"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_e
.end method

.method static createEmptyToken()Lcom/facebook/AccessToken;
    .registers 7

    .prologue
    const/4 v3, 0x0

    .line 200
    new-instance v0, Lcom/facebook/AccessToken;

    const-string v1, ""

    sget-object v2, Lcom/facebook/AccessToken;->ALREADY_EXPIRED_EXPIRATION_TIME:Ljava/util/Date;

    sget-object v5, Lcom/facebook/AccessTokenSource;->NONE:Lcom/facebook/AccessTokenSource;

    .line 201
    sget-object v6, Lcom/facebook/AccessToken;->DEFAULT_LAST_REFRESH_TIME:Ljava/util/Date;

    move-object v4, v3

    .line 200
    invoke-direct/range {v0 .. v6}, Lcom/facebook/AccessToken;-><init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/List;Ljava/util/List;Lcom/facebook/AccessTokenSource;Ljava/util/Date;)V

    return-object v0
.end method

.method static createFromCache(Landroid/os/Bundle;)Lcom/facebook/AccessToken;
    .registers 8
    .param p0, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 271
    const-string v0, "com.facebook.TokenCachingStrategy.Permissions"

    invoke-static {p0, v0}, Lcom/facebook/AccessToken;->getPermissionsFromBundle(Landroid/os/Bundle;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 272
    .local v3, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v0, "com.facebook.TokenCachingStrategy.DeclinedPermissions"

    invoke-static {p0, v0}, Lcom/facebook/AccessToken;->getPermissionsFromBundle(Landroid/os/Bundle;Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 274
    .local v4, "declinedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/facebook/AccessToken;

    const-string v1, "com.facebook.TokenCachingStrategy.Token"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 275
    const-string v2, "com.facebook.TokenCachingStrategy.ExpirationDate"

    .line 274
    invoke-static {p0, v2}, Lcom/facebook/TokenCachingStrategy;->getDate(Landroid/os/Bundle;Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    .line 276
    invoke-static {p0}, Lcom/facebook/TokenCachingStrategy;->getSource(Landroid/os/Bundle;)Lcom/facebook/AccessTokenSource;

    move-result-object v5

    .line 277
    const-string v6, "com.facebook.TokenCachingStrategy.LastRefreshDate"

    invoke-static {p0, v6}, Lcom/facebook/TokenCachingStrategy;->getDate(Landroid/os/Bundle;Ljava/lang/String;)Ljava/util/Date;

    move-result-object v6

    .line 274
    invoke-direct/range {v0 .. v6}, Lcom/facebook/AccessToken;-><init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/List;Ljava/util/List;Lcom/facebook/AccessTokenSource;Ljava/util/Date;)V

    return-object v0
.end method

.method static createFromNativeLogin(Landroid/os/Bundle;Lcom/facebook/AccessTokenSource;)Lcom/facebook/AccessToken;
    .registers 10
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "source"    # Lcom/facebook/AccessTokenSource;

    .prologue
    .line 210
    const-string v3, "com.facebook.platform.extra.EXPIRES_SECONDS_SINCE_EPOCH"

    new-instance v4, Ljava/util/Date;

    const-wide/16 v6, 0x0

    invoke-direct {v4, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 209
    invoke-static {p0, v3, v4}, Lcom/facebook/AccessToken;->getBundleLongAsDate(Landroid/os/Bundle;Ljava/lang/String;Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    .line 211
    .local v0, "expires":Ljava/util/Date;
    const-string v3, "com.facebook.platform.extra.PERMISSIONS"

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 212
    .local v1, "permissions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v3, "com.facebook.platform.extra.ACCESS_TOKEN"

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 214
    .local v2, "token":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-static {v1, v3, v2, v0, p1}, Lcom/facebook/AccessToken;->createNew(Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/Date;Lcom/facebook/AccessTokenSource;)Lcom/facebook/AccessToken;

    move-result-object v3

    return-object v3
.end method

.method static createFromRefresh(Lcom/facebook/AccessToken;Landroid/os/Bundle;)Lcom/facebook/AccessToken;
    .registers 8
    .param p0, "current"    # Lcom/facebook/AccessToken;
    .param p1, "bundle"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "FieldGetter"
        }
    .end annotation

    .prologue
    .line 239
    iget-object v2, p0, Lcom/facebook/AccessToken;->source:Lcom/facebook/AccessTokenSource;

    sget-object v3, Lcom/facebook/AccessTokenSource;->FACEBOOK_APPLICATION_WEB:Lcom/facebook/AccessTokenSource;

    if-eq v2, v3, :cond_29

    .line 240
    iget-object v2, p0, Lcom/facebook/AccessToken;->source:Lcom/facebook/AccessTokenSource;

    sget-object v3, Lcom/facebook/AccessTokenSource;->FACEBOOK_APPLICATION_NATIVE:Lcom/facebook/AccessTokenSource;

    if-eq v2, v3, :cond_29

    .line 241
    iget-object v2, p0, Lcom/facebook/AccessToken;->source:Lcom/facebook/AccessTokenSource;

    sget-object v3, Lcom/facebook/AccessTokenSource;->FACEBOOK_APPLICATION_SERVICE:Lcom/facebook/AccessTokenSource;

    if-eq v2, v3, :cond_29

    .line 242
    new-instance v2, Lcom/facebook/FacebookException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Invalid token source: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/facebook/AccessToken;->source:Lcom/facebook/AccessTokenSource;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 245
    :cond_29
    const-string v2, "expires_in"

    new-instance v3, Ljava/util/Date;

    const-wide/16 v4, 0x0

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-static {p1, v2, v3}, Lcom/facebook/AccessToken;->getBundleLongAsDate(Landroid/os/Bundle;Ljava/lang/String;Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    .line 246
    .local v0, "expires":Ljava/util/Date;
    const-string v2, "access_token"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 248
    .local v1, "token":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/facebook/AccessToken;->getPermissions()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0}, Lcom/facebook/AccessToken;->getDeclinedPermissions()Ljava/util/List;

    move-result-object v3

    iget-object v4, p0, Lcom/facebook/AccessToken;->source:Lcom/facebook/AccessTokenSource;

    invoke-static {v2, v3, v1, v0, v4}, Lcom/facebook/AccessToken;->createNew(Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/Date;Lcom/facebook/AccessTokenSource;)Lcom/facebook/AccessToken;

    move-result-object v2

    return-object v2
.end method

.method static createFromTokenWithRefreshedPermissions(Lcom/facebook/AccessToken;Ljava/util/List;Ljava/util/List;)Lcom/facebook/AccessToken;
    .registers 10
    .param p0, "token"    # Lcom/facebook/AccessToken;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/AccessToken;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/facebook/AccessToken;"
        }
    .end annotation

    .prologue
    .line 255
    .local p1, "grantedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p2, "declinedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/facebook/AccessToken;

    iget-object v1, p0, Lcom/facebook/AccessToken;->token:Ljava/lang/String;

    iget-object v2, p0, Lcom/facebook/AccessToken;->expires:Ljava/util/Date;

    iget-object v5, p0, Lcom/facebook/AccessToken;->source:Lcom/facebook/AccessTokenSource;

    iget-object v6, p0, Lcom/facebook/AccessToken;->lastRefresh:Ljava/util/Date;

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v6}, Lcom/facebook/AccessToken;-><init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/List;Ljava/util/List;Lcom/facebook/AccessTokenSource;Ljava/util/Date;)V

    return-object v0
.end method

.method static createFromWebBundle(Ljava/util/List;Landroid/os/Bundle;Lcom/facebook/AccessTokenSource;)Lcom/facebook/AccessToken;
    .registers 10
    .param p1, "bundle"    # Landroid/os/Bundle;
    .param p2, "source"    # Lcom/facebook/AccessTokenSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/os/Bundle;",
            "Lcom/facebook/AccessTokenSource;",
            ")",
            "Lcom/facebook/AccessToken;"
        }
    .end annotation

    .prologue
    .line 218
    .local p0, "requestedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v5, "expires_in"

    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    invoke-static {p1, v5, v6}, Lcom/facebook/AccessToken;->getBundleLongAsDate(Landroid/os/Bundle;Ljava/lang/String;Ljava/util/Date;)Ljava/util/Date;

    move-result-object v2

    .line 219
    .local v2, "expires":Ljava/util/Date;
    const-string v5, "access_token"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 222
    .local v4, "token":Ljava/lang/String;
    const-string v5, "granted_scopes"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 223
    .local v3, "grantedPermissions":Ljava/lang/String;
    invoke-static {v3}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2c

    .line 224
    new-instance p0, Ljava/util/ArrayList;

    .end local p0    # "requestedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v5, ","

    invoke-virtual {v3, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-direct {p0, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 226
    .restart local p0    # "requestedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2c
    const-string v5, "denied_scopes"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 227
    .local v1, "deniedPermissions":Ljava/lang/String;
    const/4 v0, 0x0

    .line 228
    .local v0, "declinedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {v1}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_48

    .line 229
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "declinedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v5, ","

    invoke-virtual {v1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 232
    .restart local v0    # "declinedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_48
    invoke-static {p0, v0, v4, v2, p2}, Lcom/facebook/AccessToken;->createNew(Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/Date;Lcom/facebook/AccessTokenSource;)Lcom/facebook/AccessToken;

    move-result-object v5

    return-object v5
.end method

.method private static createNew(Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/Date;Lcom/facebook/AccessTokenSource;)Lcom/facebook/AccessToken;
    .registers 12
    .param p2, "accessToken"    # Ljava/lang/String;
    .param p3, "expires"    # Ljava/util/Date;
    .param p4, "source"    # Lcom/facebook/AccessTokenSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/Date;",
            "Lcom/facebook/AccessTokenSource;",
            ")",
            "Lcom/facebook/AccessToken;"
        }
    .end annotation

    .prologue
    .line 263
    .local p0, "grantedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p1, "declinedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p2}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    if-nez p3, :cond_d

    .line 264
    :cond_8
    invoke-static {}, Lcom/facebook/AccessToken;->createEmptyToken()Lcom/facebook/AccessToken;

    move-result-object v0

    .line 266
    :goto_c
    return-object v0

    :cond_d
    new-instance v0, Lcom/facebook/AccessToken;

    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    move-object v1, p2

    move-object v2, p3

    move-object v3, p0

    move-object v4, p1

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/facebook/AccessToken;-><init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/List;Ljava/util/List;Lcom/facebook/AccessTokenSource;Ljava/util/Date;)V

    goto :goto_c
.end method

.method private static getBundleLongAsDate(Landroid/os/Bundle;Ljava/lang/String;Ljava/util/Date;)Ljava/util/Date;
    .registers 13
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "dateBase"    # Ljava/util/Date;

    .prologue
    const/4 v4, 0x0

    .line 401
    if-nez p0, :cond_4

    .line 423
    :cond_3
    :goto_3
    return-object v4

    .line 405
    :cond_4
    const-wide/high16 v2, -0x8000000000000000L

    .line 407
    .local v2, "secondsFromBase":J
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 408
    .local v1, "secondsObject":Ljava/lang/Object;
    instance-of v5, v1, Ljava/lang/Long;

    if-eqz v5, :cond_25

    .line 409
    check-cast v1, Ljava/lang/Long;

    .end local v1    # "secondsObject":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 420
    :goto_14
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-nez v4, :cond_32

    .line 421
    new-instance v4, Ljava/util/Date;

    const-wide v6, 0x7fffffffffffffffL

    invoke-direct {v4, v6, v7}, Ljava/util/Date;-><init>(J)V

    goto :goto_3

    .line 410
    .restart local v1    # "secondsObject":Ljava/lang/Object;
    :cond_25
    instance-of v5, v1, Ljava/lang/String;

    if-eqz v5, :cond_3

    .line 412
    :try_start_29
    check-cast v1, Ljava/lang/String;

    .end local v1    # "secondsObject":Ljava/lang/Object;
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_2e
    .catch Ljava/lang/NumberFormatException; {:try_start_29 .. :try_end_2e} :catch_30

    move-result-wide v2

    goto :goto_14

    .line 413
    :catch_30
    move-exception v0

    .line 414
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_3

    .line 423
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_32
    new-instance v4, Ljava/util/Date;

    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    mul-long/2addr v8, v2

    add-long/2addr v6, v8

    invoke-direct {v4, v6, v7}, Ljava/util/Date;-><init>(J)V

    goto :goto_3
.end method

.method static getPermissionsFromBundle(Landroid/os/Bundle;Ljava/lang/String;)Ljava/util/List;
    .registers 5
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 282
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 284
    .local v0, "originalPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v0, :cond_b

    .line 285
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    .line 289
    .local v1, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_a
    return-object v1

    .line 287
    .end local v1    # "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_b
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .restart local v1    # "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_a
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 4
    .param p1, "stream"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InvalidObjectException;
        }
    .end annotation

    .prologue
    .line 396
    new-instance v0, Ljava/io/InvalidObjectException;

    const-string v1, "Cannot readObject, serialization proxy required"

    invoke-direct {v0, v1}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private tokenToString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 323
    iget-object v0, p0, Lcom/facebook/AccessToken;->token:Ljava/lang/String;

    if-nez v0, :cond_7

    .line 324
    const-string v0, "null"

    .line 328
    :goto_6
    return-object v0

    .line 325
    :cond_7
    sget-object v0, Lcom/facebook/LoggingBehavior;->INCLUDE_ACCESS_TOKENS:Lcom/facebook/LoggingBehavior;

    invoke-static {v0}, Lcom/facebook/Settings;->isLoggingBehaviorEnabled(Lcom/facebook/LoggingBehavior;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 326
    iget-object v0, p0, Lcom/facebook/AccessToken;->token:Ljava/lang/String;

    goto :goto_6

    .line 328
    :cond_12
    const-string v0, "ACCESS_TOKEN_REMOVED"

    goto :goto_6
.end method

.method private writeReplace()Ljava/lang/Object;
    .registers 9

    .prologue
    .line 391
    new-instance v0, Lcom/facebook/AccessToken$SerializationProxyV2;

    iget-object v1, p0, Lcom/facebook/AccessToken;->token:Ljava/lang/String;

    iget-object v2, p0, Lcom/facebook/AccessToken;->expires:Ljava/util/Date;

    iget-object v3, p0, Lcom/facebook/AccessToken;->permissions:Ljava/util/List;

    iget-object v4, p0, Lcom/facebook/AccessToken;->declinedPermissions:Ljava/util/List;

    iget-object v5, p0, Lcom/facebook/AccessToken;->source:Lcom/facebook/AccessTokenSource;

    iget-object v6, p0, Lcom/facebook/AccessToken;->lastRefresh:Ljava/util/Date;

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/facebook/AccessToken$SerializationProxyV2;-><init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/List;Ljava/util/List;Lcom/facebook/AccessTokenSource;Ljava/util/Date;Lcom/facebook/AccessToken$SerializationProxyV2;)V

    return-object v0
.end method


# virtual methods
.method public getDeclinedPermissions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lcom/facebook/AccessToken;->declinedPermissions:Ljava/util/List;

    return-object v0
.end method

.method public getExpires()Ljava/util/Date;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/facebook/AccessToken;->expires:Ljava/util/Date;

    return-object v0
.end method

.method public getLastRefresh()Ljava/util/Date;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/facebook/AccessToken;->lastRefresh:Ljava/util/Date;

    return-object v0
.end method

.method public getPermissions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lcom/facebook/AccessToken;->permissions:Ljava/util/List;

    return-object v0
.end method

.method public getSource()Lcom/facebook/AccessTokenSource;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lcom/facebook/AccessToken;->source:Lcom/facebook/AccessTokenSource;

    return-object v0
.end method

.method public getToken()Ljava/lang/String;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/facebook/AccessToken;->token:Ljava/lang/String;

    return-object v0
.end method

.method isInvalid()Z
    .registers 3

    .prologue
    .line 306
    iget-object v0, p0, Lcom/facebook/AccessToken;->token:Ljava/lang/String;

    invoke-static {v0}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_17

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iget-object v1, p0, Lcom/facebook/AccessToken;->expires:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v0

    if-nez v0, :cond_17

    const/4 v0, 0x0

    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x1

    goto :goto_16
.end method

.method toCacheBundle()Landroid/os/Bundle;
    .registers 5

    .prologue
    .line 293
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 295
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "com.facebook.TokenCachingStrategy.Token"

    iget-object v2, p0, Lcom/facebook/AccessToken;->token:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    const-string v1, "com.facebook.TokenCachingStrategy.ExpirationDate"

    iget-object v2, p0, Lcom/facebook/AccessToken;->expires:Ljava/util/Date;

    invoke-static {v0, v1, v2}, Lcom/facebook/TokenCachingStrategy;->putDate(Landroid/os/Bundle;Ljava/lang/String;Ljava/util/Date;)V

    .line 297
    const-string v1, "com.facebook.TokenCachingStrategy.Permissions"

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/facebook/AccessToken;->permissions:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 298
    const-string v1, "com.facebook.TokenCachingStrategy.DeclinedPermissions"

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/facebook/AccessToken;->declinedPermissions:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 299
    const-string v1, "com.facebook.TokenCachingStrategy.AccessTokenSource"

    iget-object v2, p0, Lcom/facebook/AccessToken;->source:Lcom/facebook/AccessTokenSource;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 300
    const-string v1, "com.facebook.TokenCachingStrategy.LastRefreshDate"

    iget-object v2, p0, Lcom/facebook/AccessToken;->lastRefresh:Ljava/util/Date;

    invoke-static {v0, v1, v2}, Lcom/facebook/TokenCachingStrategy;->putDate(Landroid/os/Bundle;Ljava/lang/String;Ljava/util/Date;)V

    .line 302
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v1, "{AccessToken"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    const-string v1, " token:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/facebook/AccessToken;->tokenToString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    invoke-direct {p0, v0}, Lcom/facebook/AccessToken;->appendPermissions(Ljava/lang/StringBuilder;)V

    .line 194
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
