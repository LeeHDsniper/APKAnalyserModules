.class public final enum Lcom/facebook/LoggingBehavior;
.super Ljava/lang/Enum;
.source "LoggingBehavior.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/facebook/LoggingBehavior;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum APP_EVENTS:Lcom/facebook/LoggingBehavior;

.field public static final enum CACHE:Lcom/facebook/LoggingBehavior;

.field public static final enum DEVELOPER_ERRORS:Lcom/facebook/LoggingBehavior;

.field private static final synthetic ENUM$VALUES:[Lcom/facebook/LoggingBehavior;

.field public static final enum INCLUDE_ACCESS_TOKENS:Lcom/facebook/LoggingBehavior;

.field public static final enum INCLUDE_RAW_RESPONSES:Lcom/facebook/LoggingBehavior;

.field public static final INSIGHTS:Lcom/facebook/LoggingBehavior;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum REQUESTS:Lcom/facebook/LoggingBehavior;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 25
    new-instance v0, Lcom/facebook/LoggingBehavior;

    const-string v1, "REQUESTS"

    invoke-direct {v0, v1, v3}, Lcom/facebook/LoggingBehavior;-><init>(Ljava/lang/String;I)V

    .line 28
    sput-object v0, Lcom/facebook/LoggingBehavior;->REQUESTS:Lcom/facebook/LoggingBehavior;

    .line 29
    new-instance v0, Lcom/facebook/LoggingBehavior;

    const-string v1, "INCLUDE_ACCESS_TOKENS"

    invoke-direct {v0, v1, v4}, Lcom/facebook/LoggingBehavior;-><init>(Ljava/lang/String;I)V

    .line 32
    sput-object v0, Lcom/facebook/LoggingBehavior;->INCLUDE_ACCESS_TOKENS:Lcom/facebook/LoggingBehavior;

    .line 33
    new-instance v0, Lcom/facebook/LoggingBehavior;

    const-string v1, "INCLUDE_RAW_RESPONSES"

    invoke-direct {v0, v1, v5}, Lcom/facebook/LoggingBehavior;-><init>(Ljava/lang/String;I)V

    .line 36
    sput-object v0, Lcom/facebook/LoggingBehavior;->INCLUDE_RAW_RESPONSES:Lcom/facebook/LoggingBehavior;

    .line 37
    new-instance v0, Lcom/facebook/LoggingBehavior;

    const-string v1, "CACHE"

    invoke-direct {v0, v1, v6}, Lcom/facebook/LoggingBehavior;-><init>(Ljava/lang/String;I)V

    .line 40
    sput-object v0, Lcom/facebook/LoggingBehavior;->CACHE:Lcom/facebook/LoggingBehavior;

    .line 41
    new-instance v0, Lcom/facebook/LoggingBehavior;

    const-string v1, "APP_EVENTS"

    invoke-direct {v0, v1, v7}, Lcom/facebook/LoggingBehavior;-><init>(Ljava/lang/String;I)V

    .line 44
    sput-object v0, Lcom/facebook/LoggingBehavior;->APP_EVENTS:Lcom/facebook/LoggingBehavior;

    .line 45
    new-instance v0, Lcom/facebook/LoggingBehavior;

    const-string v1, "DEVELOPER_ERRORS"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/facebook/LoggingBehavior;-><init>(Ljava/lang/String;I)V

    .line 48
    sput-object v0, Lcom/facebook/LoggingBehavior;->DEVELOPER_ERRORS:Lcom/facebook/LoggingBehavior;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/facebook/LoggingBehavior;

    sget-object v1, Lcom/facebook/LoggingBehavior;->REQUESTS:Lcom/facebook/LoggingBehavior;

    aput-object v1, v0, v3

    sget-object v1, Lcom/facebook/LoggingBehavior;->INCLUDE_ACCESS_TOKENS:Lcom/facebook/LoggingBehavior;

    aput-object v1, v0, v4

    sget-object v1, Lcom/facebook/LoggingBehavior;->INCLUDE_RAW_RESPONSES:Lcom/facebook/LoggingBehavior;

    aput-object v1, v0, v5

    sget-object v1, Lcom/facebook/LoggingBehavior;->CACHE:Lcom/facebook/LoggingBehavior;

    aput-object v1, v0, v6

    sget-object v1, Lcom/facebook/LoggingBehavior;->APP_EVENTS:Lcom/facebook/LoggingBehavior;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/facebook/LoggingBehavior;->DEVELOPER_ERRORS:Lcom/facebook/LoggingBehavior;

    aput-object v2, v0, v1

    sput-object v0, Lcom/facebook/LoggingBehavior;->ENUM$VALUES:[Lcom/facebook/LoggingBehavior;

    .line 52
    sget-object v0, Lcom/facebook/LoggingBehavior;->APP_EVENTS:Lcom/facebook/LoggingBehavior;

    sput-object v0, Lcom/facebook/LoggingBehavior;->INSIGHTS:Lcom/facebook/LoggingBehavior;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/LoggingBehavior;
    .registers 2

    .prologue
    .line 1
    const-class v0, Lcom/facebook/LoggingBehavior;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/facebook/LoggingBehavior;

    return-object v0
.end method

.method public static values()[Lcom/facebook/LoggingBehavior;
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/facebook/LoggingBehavior;->ENUM$VALUES:[Lcom/facebook/LoggingBehavior;

    array-length v1, v0

    new-array v2, v1, [Lcom/facebook/LoggingBehavior;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
