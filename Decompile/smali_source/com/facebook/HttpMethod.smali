.class public final enum Lcom/facebook/HttpMethod;
.super Ljava/lang/Enum;
.source "HttpMethod.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/facebook/HttpMethod;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum DELETE:Lcom/facebook/HttpMethod;

.field private static final synthetic ENUM$VALUES:[Lcom/facebook/HttpMethod;

.field public static final enum GET:Lcom/facebook/HttpMethod;

.field public static final enum POST:Lcom/facebook/HttpMethod;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 23
    new-instance v0, Lcom/facebook/HttpMethod;

    const-string v1, "GET"

    invoke-direct {v0, v1, v2}, Lcom/facebook/HttpMethod;-><init>(Ljava/lang/String;I)V

    .line 26
    sput-object v0, Lcom/facebook/HttpMethod;->GET:Lcom/facebook/HttpMethod;

    .line 28
    new-instance v0, Lcom/facebook/HttpMethod;

    const-string v1, "POST"

    invoke-direct {v0, v1, v3}, Lcom/facebook/HttpMethod;-><init>(Ljava/lang/String;I)V

    .line 31
    sput-object v0, Lcom/facebook/HttpMethod;->POST:Lcom/facebook/HttpMethod;

    .line 33
    new-instance v0, Lcom/facebook/HttpMethod;

    const-string v1, "DELETE"

    invoke-direct {v0, v1, v4}, Lcom/facebook/HttpMethod;-><init>(Ljava/lang/String;I)V

    .line 36
    sput-object v0, Lcom/facebook/HttpMethod;->DELETE:Lcom/facebook/HttpMethod;

    .line 22
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/facebook/HttpMethod;

    sget-object v1, Lcom/facebook/HttpMethod;->GET:Lcom/facebook/HttpMethod;

    aput-object v1, v0, v2

    sget-object v1, Lcom/facebook/HttpMethod;->POST:Lcom/facebook/HttpMethod;

    aput-object v1, v0, v3

    sget-object v1, Lcom/facebook/HttpMethod;->DELETE:Lcom/facebook/HttpMethod;

    aput-object v1, v0, v4

    sput-object v0, Lcom/facebook/HttpMethod;->ENUM$VALUES:[Lcom/facebook/HttpMethod;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/HttpMethod;
    .registers 2

    .prologue
    .line 1
    const-class v0, Lcom/facebook/HttpMethod;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/facebook/HttpMethod;

    return-object v0
.end method

.method public static values()[Lcom/facebook/HttpMethod;
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/facebook/HttpMethod;->ENUM$VALUES:[Lcom/facebook/HttpMethod;

    array-length v1, v0

    new-array v2, v1, [Lcom/facebook/HttpMethod;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
