.class public final enum Lcom/facebook/AccessTokenSource;
.super Ljava/lang/Enum;
.source "AccessTokenSource.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/facebook/AccessTokenSource;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CLIENT_TOKEN:Lcom/facebook/AccessTokenSource;

.field private static final synthetic ENUM$VALUES:[Lcom/facebook/AccessTokenSource;

.field public static final enum FACEBOOK_APPLICATION_NATIVE:Lcom/facebook/AccessTokenSource;

.field public static final enum FACEBOOK_APPLICATION_SERVICE:Lcom/facebook/AccessTokenSource;

.field public static final enum FACEBOOK_APPLICATION_WEB:Lcom/facebook/AccessTokenSource;

.field public static final enum NONE:Lcom/facebook/AccessTokenSource;

.field public static final enum TEST_USER:Lcom/facebook/AccessTokenSource;

.field public static final enum WEB_VIEW:Lcom/facebook/AccessTokenSource;


# instance fields
.field private final canExtendToken:Z


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 23
    new-instance v0, Lcom/facebook/AccessTokenSource;

    const-string v1, "NONE"

    .line 26
    invoke-direct {v0, v1, v4, v4}, Lcom/facebook/AccessTokenSource;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/facebook/AccessTokenSource;->NONE:Lcom/facebook/AccessTokenSource;

    .line 27
    new-instance v0, Lcom/facebook/AccessTokenSource;

    const-string v1, "FACEBOOK_APPLICATION_WEB"

    .line 31
    invoke-direct {v0, v1, v3, v3}, Lcom/facebook/AccessTokenSource;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/facebook/AccessTokenSource;->FACEBOOK_APPLICATION_WEB:Lcom/facebook/AccessTokenSource;

    .line 32
    new-instance v0, Lcom/facebook/AccessTokenSource;

    const-string v1, "FACEBOOK_APPLICATION_NATIVE"

    .line 36
    invoke-direct {v0, v1, v5, v3}, Lcom/facebook/AccessTokenSource;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/facebook/AccessTokenSource;->FACEBOOK_APPLICATION_NATIVE:Lcom/facebook/AccessTokenSource;

    .line 37
    new-instance v0, Lcom/facebook/AccessTokenSource;

    const-string v1, "FACEBOOK_APPLICATION_SERVICE"

    .line 42
    invoke-direct {v0, v1, v6, v3}, Lcom/facebook/AccessTokenSource;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/facebook/AccessTokenSource;->FACEBOOK_APPLICATION_SERVICE:Lcom/facebook/AccessTokenSource;

    .line 43
    new-instance v0, Lcom/facebook/AccessTokenSource;

    const-string v1, "WEB_VIEW"

    .line 47
    invoke-direct {v0, v1, v7, v4}, Lcom/facebook/AccessTokenSource;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/facebook/AccessTokenSource;->WEB_VIEW:Lcom/facebook/AccessTokenSource;

    .line 48
    new-instance v0, Lcom/facebook/AccessTokenSource;

    const-string v1, "TEST_USER"

    const/4 v2, 0x5

    .line 52
    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/AccessTokenSource;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/facebook/AccessTokenSource;->TEST_USER:Lcom/facebook/AccessTokenSource;

    .line 53
    new-instance v0, Lcom/facebook/AccessTokenSource;

    const-string v1, "CLIENT_TOKEN"

    const/4 v2, 0x6

    .line 56
    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/AccessTokenSource;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/facebook/AccessTokenSource;->CLIENT_TOKEN:Lcom/facebook/AccessTokenSource;

    .line 22
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/facebook/AccessTokenSource;

    sget-object v1, Lcom/facebook/AccessTokenSource;->NONE:Lcom/facebook/AccessTokenSource;

    aput-object v1, v0, v4

    sget-object v1, Lcom/facebook/AccessTokenSource;->FACEBOOK_APPLICATION_WEB:Lcom/facebook/AccessTokenSource;

    aput-object v1, v0, v3

    sget-object v1, Lcom/facebook/AccessTokenSource;->FACEBOOK_APPLICATION_NATIVE:Lcom/facebook/AccessTokenSource;

    aput-object v1, v0, v5

    sget-object v1, Lcom/facebook/AccessTokenSource;->FACEBOOK_APPLICATION_SERVICE:Lcom/facebook/AccessTokenSource;

    aput-object v1, v0, v6

    sget-object v1, Lcom/facebook/AccessTokenSource;->WEB_VIEW:Lcom/facebook/AccessTokenSource;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/facebook/AccessTokenSource;->TEST_USER:Lcom/facebook/AccessTokenSource;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/facebook/AccessTokenSource;->CLIENT_TOKEN:Lcom/facebook/AccessTokenSource;

    aput-object v2, v0, v1

    sput-object v0, Lcom/facebook/AccessTokenSource;->ENUM$VALUES:[Lcom/facebook/AccessTokenSource;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZ)V
    .registers 4
    .param p3, "canExtendToken"    # Z

    .prologue
    .line 60
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 61
    iput-boolean p3, p0, Lcom/facebook/AccessTokenSource;->canExtendToken:Z

    .line 62
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/AccessTokenSource;
    .registers 2

    .prologue
    .line 1
    const-class v0, Lcom/facebook/AccessTokenSource;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/facebook/AccessTokenSource;

    return-object v0
.end method

.method public static values()[Lcom/facebook/AccessTokenSource;
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/facebook/AccessTokenSource;->ENUM$VALUES:[Lcom/facebook/AccessTokenSource;

    array-length v1, v0

    new-array v2, v1, [Lcom/facebook/AccessTokenSource;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method canExtendToken()Z
    .registers 2

    .prologue
    .line 65
    iget-boolean v0, p0, Lcom/facebook/AccessTokenSource;->canExtendToken:Z

    return v0
.end method
