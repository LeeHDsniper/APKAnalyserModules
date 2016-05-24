.class public final enum Lcom/facebook/FacebookRequestError$Category;
.super Ljava/lang/Enum;
.source "FacebookRequestError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/FacebookRequestError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Category"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/facebook/FacebookRequestError$Category;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AUTHENTICATION_REOPEN_SESSION:Lcom/facebook/FacebookRequestError$Category;

.field public static final enum AUTHENTICATION_RETRY:Lcom/facebook/FacebookRequestError$Category;

.field public static final enum BAD_REQUEST:Lcom/facebook/FacebookRequestError$Category;

.field public static final enum CLIENT:Lcom/facebook/FacebookRequestError$Category;

.field private static final synthetic ENUM$VALUES:[Lcom/facebook/FacebookRequestError$Category;

.field public static final enum OTHER:Lcom/facebook/FacebookRequestError$Category;

.field public static final enum PERMISSION:Lcom/facebook/FacebookRequestError$Category;

.field public static final enum SERVER:Lcom/facebook/FacebookRequestError$Category;

.field public static final enum THROTTLING:Lcom/facebook/FacebookRequestError$Category;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 461
    new-instance v0, Lcom/facebook/FacebookRequestError$Category;

    const-string v1, "AUTHENTICATION_RETRY"

    invoke-direct {v0, v1, v3}, Lcom/facebook/FacebookRequestError$Category;-><init>(Ljava/lang/String;I)V

    .line 465
    sput-object v0, Lcom/facebook/FacebookRequestError$Category;->AUTHENTICATION_RETRY:Lcom/facebook/FacebookRequestError$Category;

    .line 467
    new-instance v0, Lcom/facebook/FacebookRequestError$Category;

    const-string v1, "AUTHENTICATION_REOPEN_SESSION"

    invoke-direct {v0, v1, v4}, Lcom/facebook/FacebookRequestError$Category;-><init>(Ljava/lang/String;I)V

    .line 471
    sput-object v0, Lcom/facebook/FacebookRequestError$Category;->AUTHENTICATION_REOPEN_SESSION:Lcom/facebook/FacebookRequestError$Category;

    .line 473
    new-instance v0, Lcom/facebook/FacebookRequestError$Category;

    const-string v1, "PERMISSION"

    invoke-direct {v0, v1, v5}, Lcom/facebook/FacebookRequestError$Category;-><init>(Ljava/lang/String;I)V

    .line 474
    sput-object v0, Lcom/facebook/FacebookRequestError$Category;->PERMISSION:Lcom/facebook/FacebookRequestError$Category;

    .line 476
    new-instance v0, Lcom/facebook/FacebookRequestError$Category;

    const-string v1, "SERVER"

    invoke-direct {v0, v1, v6}, Lcom/facebook/FacebookRequestError$Category;-><init>(Ljava/lang/String;I)V

    .line 480
    sput-object v0, Lcom/facebook/FacebookRequestError$Category;->SERVER:Lcom/facebook/FacebookRequestError$Category;

    .line 482
    new-instance v0, Lcom/facebook/FacebookRequestError$Category;

    const-string v1, "THROTTLING"

    invoke-direct {v0, v1, v7}, Lcom/facebook/FacebookRequestError$Category;-><init>(Ljava/lang/String;I)V

    .line 483
    sput-object v0, Lcom/facebook/FacebookRequestError$Category;->THROTTLING:Lcom/facebook/FacebookRequestError$Category;

    .line 485
    new-instance v0, Lcom/facebook/FacebookRequestError$Category;

    const-string v1, "OTHER"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/facebook/FacebookRequestError$Category;-><init>(Ljava/lang/String;I)V

    .line 489
    sput-object v0, Lcom/facebook/FacebookRequestError$Category;->OTHER:Lcom/facebook/FacebookRequestError$Category;

    .line 491
    new-instance v0, Lcom/facebook/FacebookRequestError$Category;

    const-string v1, "BAD_REQUEST"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/facebook/FacebookRequestError$Category;-><init>(Ljava/lang/String;I)V

    .line 495
    sput-object v0, Lcom/facebook/FacebookRequestError$Category;->BAD_REQUEST:Lcom/facebook/FacebookRequestError$Category;

    .line 497
    new-instance v0, Lcom/facebook/FacebookRequestError$Category;

    const-string v1, "CLIENT"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/facebook/FacebookRequestError$Category;-><init>(Ljava/lang/String;I)V

    .line 501
    sput-object v0, Lcom/facebook/FacebookRequestError$Category;->CLIENT:Lcom/facebook/FacebookRequestError$Category;

    .line 460
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/facebook/FacebookRequestError$Category;

    sget-object v1, Lcom/facebook/FacebookRequestError$Category;->AUTHENTICATION_RETRY:Lcom/facebook/FacebookRequestError$Category;

    aput-object v1, v0, v3

    sget-object v1, Lcom/facebook/FacebookRequestError$Category;->AUTHENTICATION_REOPEN_SESSION:Lcom/facebook/FacebookRequestError$Category;

    aput-object v1, v0, v4

    sget-object v1, Lcom/facebook/FacebookRequestError$Category;->PERMISSION:Lcom/facebook/FacebookRequestError$Category;

    aput-object v1, v0, v5

    sget-object v1, Lcom/facebook/FacebookRequestError$Category;->SERVER:Lcom/facebook/FacebookRequestError$Category;

    aput-object v1, v0, v6

    sget-object v1, Lcom/facebook/FacebookRequestError$Category;->THROTTLING:Lcom/facebook/FacebookRequestError$Category;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/facebook/FacebookRequestError$Category;->OTHER:Lcom/facebook/FacebookRequestError$Category;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/facebook/FacebookRequestError$Category;->BAD_REQUEST:Lcom/facebook/FacebookRequestError$Category;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/facebook/FacebookRequestError$Category;->CLIENT:Lcom/facebook/FacebookRequestError$Category;

    aput-object v2, v0, v1

    sput-object v0, Lcom/facebook/FacebookRequestError$Category;->ENUM$VALUES:[Lcom/facebook/FacebookRequestError$Category;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .prologue
    .line 460
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/FacebookRequestError$Category;
    .registers 2

    .prologue
    .line 1
    const-class v0, Lcom/facebook/FacebookRequestError$Category;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/facebook/FacebookRequestError$Category;

    return-object v0
.end method

.method public static values()[Lcom/facebook/FacebookRequestError$Category;
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/facebook/FacebookRequestError$Category;->ENUM$VALUES:[Lcom/facebook/FacebookRequestError$Category;

    array-length v1, v0

    new-array v2, v1, [Lcom/facebook/FacebookRequestError$Category;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
