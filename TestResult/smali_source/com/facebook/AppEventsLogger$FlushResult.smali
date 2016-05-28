.class final enum Lcom/facebook/AppEventsLogger$FlushResult;
.super Ljava/lang/Enum;
.source "AppEventsLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/AppEventsLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "FlushResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/facebook/AppEventsLogger$FlushResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/facebook/AppEventsLogger$FlushResult;

.field public static final enum NO_CONNECTIVITY:Lcom/facebook/AppEventsLogger$FlushResult;

.field public static final enum SERVER_ERROR:Lcom/facebook/AppEventsLogger$FlushResult;

.field public static final enum SUCCESS:Lcom/facebook/AppEventsLogger$FlushResult;

.field public static final enum UNKNOWN_ERROR:Lcom/facebook/AppEventsLogger$FlushResult;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 605
    new-instance v0, Lcom/facebook/AppEventsLogger$FlushResult;

    const-string v1, "SUCCESS"

    invoke-direct {v0, v1, v2}, Lcom/facebook/AppEventsLogger$FlushResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/facebook/AppEventsLogger$FlushResult;->SUCCESS:Lcom/facebook/AppEventsLogger$FlushResult;

    .line 606
    new-instance v0, Lcom/facebook/AppEventsLogger$FlushResult;

    const-string v1, "SERVER_ERROR"

    invoke-direct {v0, v1, v3}, Lcom/facebook/AppEventsLogger$FlushResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/facebook/AppEventsLogger$FlushResult;->SERVER_ERROR:Lcom/facebook/AppEventsLogger$FlushResult;

    .line 607
    new-instance v0, Lcom/facebook/AppEventsLogger$FlushResult;

    const-string v1, "NO_CONNECTIVITY"

    invoke-direct {v0, v1, v4}, Lcom/facebook/AppEventsLogger$FlushResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/facebook/AppEventsLogger$FlushResult;->NO_CONNECTIVITY:Lcom/facebook/AppEventsLogger$FlushResult;

    .line 608
    new-instance v0, Lcom/facebook/AppEventsLogger$FlushResult;

    const-string v1, "UNKNOWN_ERROR"

    invoke-direct {v0, v1, v5}, Lcom/facebook/AppEventsLogger$FlushResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/facebook/AppEventsLogger$FlushResult;->UNKNOWN_ERROR:Lcom/facebook/AppEventsLogger$FlushResult;

    .line 604
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/facebook/AppEventsLogger$FlushResult;

    sget-object v1, Lcom/facebook/AppEventsLogger$FlushResult;->SUCCESS:Lcom/facebook/AppEventsLogger$FlushResult;

    aput-object v1, v0, v2

    sget-object v1, Lcom/facebook/AppEventsLogger$FlushResult;->SERVER_ERROR:Lcom/facebook/AppEventsLogger$FlushResult;

    aput-object v1, v0, v3

    sget-object v1, Lcom/facebook/AppEventsLogger$FlushResult;->NO_CONNECTIVITY:Lcom/facebook/AppEventsLogger$FlushResult;

    aput-object v1, v0, v4

    sget-object v1, Lcom/facebook/AppEventsLogger$FlushResult;->UNKNOWN_ERROR:Lcom/facebook/AppEventsLogger$FlushResult;

    aput-object v1, v0, v5

    sput-object v0, Lcom/facebook/AppEventsLogger$FlushResult;->ENUM$VALUES:[Lcom/facebook/AppEventsLogger$FlushResult;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .prologue
    .line 604
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/AppEventsLogger$FlushResult;
    .registers 2

    .prologue
    .line 1
    const-class v0, Lcom/facebook/AppEventsLogger$FlushResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/facebook/AppEventsLogger$FlushResult;

    return-object v0
.end method

.method public static values()[Lcom/facebook/AppEventsLogger$FlushResult;
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/facebook/AppEventsLogger$FlushResult;->ENUM$VALUES:[Lcom/facebook/AppEventsLogger$FlushResult;

    array-length v1, v0

    new-array v2, v1, [Lcom/facebook/AppEventsLogger$FlushResult;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
