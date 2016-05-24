.class public final enum Lcom/facebook/SessionDefaultAudience;
.super Ljava/lang/Enum;
.source "SessionDefaultAudience.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/facebook/SessionDefaultAudience;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/facebook/SessionDefaultAudience;

.field public static final enum EVERYONE:Lcom/facebook/SessionDefaultAudience;

.field public static final enum FRIENDS:Lcom/facebook/SessionDefaultAudience;

.field public static final enum NONE:Lcom/facebook/SessionDefaultAudience;

.field public static final enum ONLY_ME:Lcom/facebook/SessionDefaultAudience;


# instance fields
.field private final nativeProtocolAudience:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 28
    new-instance v0, Lcom/facebook/SessionDefaultAudience;

    const-string v1, "NONE"

    .line 31
    const/4 v2, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/facebook/SessionDefaultAudience;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/SessionDefaultAudience;->NONE:Lcom/facebook/SessionDefaultAudience;

    .line 33
    new-instance v0, Lcom/facebook/SessionDefaultAudience;

    const-string v1, "ONLY_ME"

    .line 36
    const-string v2, "only_me"

    invoke-direct {v0, v1, v4, v2}, Lcom/facebook/SessionDefaultAudience;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/SessionDefaultAudience;->ONLY_ME:Lcom/facebook/SessionDefaultAudience;

    .line 38
    new-instance v0, Lcom/facebook/SessionDefaultAudience;

    const-string v1, "FRIENDS"

    .line 41
    const-string v2, "friends"

    invoke-direct {v0, v1, v5, v2}, Lcom/facebook/SessionDefaultAudience;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/SessionDefaultAudience;->FRIENDS:Lcom/facebook/SessionDefaultAudience;

    .line 43
    new-instance v0, Lcom/facebook/SessionDefaultAudience;

    const-string v1, "EVERYONE"

    .line 46
    const-string v2, "everyone"

    invoke-direct {v0, v1, v6, v2}, Lcom/facebook/SessionDefaultAudience;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/SessionDefaultAudience;->EVERYONE:Lcom/facebook/SessionDefaultAudience;

    .line 27
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/facebook/SessionDefaultAudience;

    sget-object v1, Lcom/facebook/SessionDefaultAudience;->NONE:Lcom/facebook/SessionDefaultAudience;

    aput-object v1, v0, v3

    sget-object v1, Lcom/facebook/SessionDefaultAudience;->ONLY_ME:Lcom/facebook/SessionDefaultAudience;

    aput-object v1, v0, v4

    sget-object v1, Lcom/facebook/SessionDefaultAudience;->FRIENDS:Lcom/facebook/SessionDefaultAudience;

    aput-object v1, v0, v5

    sget-object v1, Lcom/facebook/SessionDefaultAudience;->EVERYONE:Lcom/facebook/SessionDefaultAudience;

    aput-object v1, v0, v6

    sput-object v0, Lcom/facebook/SessionDefaultAudience;->ENUM$VALUES:[Lcom/facebook/SessionDefaultAudience;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4
    .param p3, "protocol"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 51
    iput-object p3, p0, Lcom/facebook/SessionDefaultAudience;->nativeProtocolAudience:Ljava/lang/String;

    .line 52
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/SessionDefaultAudience;
    .registers 2

    .prologue
    .line 1
    const-class v0, Lcom/facebook/SessionDefaultAudience;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/facebook/SessionDefaultAudience;

    return-object v0
.end method

.method public static values()[Lcom/facebook/SessionDefaultAudience;
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/facebook/SessionDefaultAudience;->ENUM$VALUES:[Lcom/facebook/SessionDefaultAudience;

    array-length v1, v0

    new-array v2, v1, [Lcom/facebook/SessionDefaultAudience;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public getNativeProtocolAudience()Ljava/lang/String;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/facebook/SessionDefaultAudience;->nativeProtocolAudience:Ljava/lang/String;

    return-object v0
.end method
