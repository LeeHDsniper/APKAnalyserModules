.class Lcom/facebook/AuthorizationClient$Result;
.super Ljava/lang/Object;
.source "AuthorizationClient.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/AuthorizationClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Result"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/AuthorizationClient$Result$Code;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field final code:Lcom/facebook/AuthorizationClient$Result$Code;

.field final errorCode:Ljava/lang/String;

.field final errorMessage:Ljava/lang/String;

.field loggingExtras:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final request:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

.field final token:Lcom/facebook/AccessToken;


# direct methods
.method private constructor <init>(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Lcom/facebook/AuthorizationClient$Result$Code;Lcom/facebook/AccessToken;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "request"    # Lcom/facebook/AuthorizationClient$AuthorizationRequest;
    .param p2, "code"    # Lcom/facebook/AuthorizationClient$Result$Code;
    .param p3, "token"    # Lcom/facebook/AccessToken;
    .param p4, "errorMessage"    # Ljava/lang/String;
    .param p5, "errorCode"    # Ljava/lang/String;

    .prologue
    .line 1050
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1052
    iput-object p1, p0, Lcom/facebook/AuthorizationClient$Result;->request:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    .line 1053
    iput-object p3, p0, Lcom/facebook/AuthorizationClient$Result;->token:Lcom/facebook/AccessToken;

    .line 1054
    iput-object p4, p0, Lcom/facebook/AuthorizationClient$Result;->errorMessage:Ljava/lang/String;

    .line 1055
    iput-object p2, p0, Lcom/facebook/AuthorizationClient$Result;->code:Lcom/facebook/AuthorizationClient$Result$Code;

    .line 1056
    iput-object p5, p0, Lcom/facebook/AuthorizationClient$Result;->errorCode:Ljava/lang/String;

    .line 1057
    return-void
.end method

.method static createCancelResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Ljava/lang/String;)Lcom/facebook/AuthorizationClient$Result;
    .registers 8
    .param p0, "request"    # Lcom/facebook/AuthorizationClient$AuthorizationRequest;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1064
    new-instance v0, Lcom/facebook/AuthorizationClient$Result;

    sget-object v2, Lcom/facebook/AuthorizationClient$Result$Code;->CANCEL:Lcom/facebook/AuthorizationClient$Result$Code;

    move-object v1, p0

    move-object v4, p1

    move-object v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/facebook/AuthorizationClient$Result;-><init>(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Lcom/facebook/AuthorizationClient$Result$Code;Lcom/facebook/AccessToken;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method static createErrorResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/AuthorizationClient$Result;
    .registers 4
    .param p0, "request"    # Lcom/facebook/AuthorizationClient$AuthorizationRequest;
    .param p1, "errorType"    # Ljava/lang/String;
    .param p2, "errorDescription"    # Ljava/lang/String;

    .prologue
    .line 1068
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/facebook/AuthorizationClient$Result;->createErrorResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/AuthorizationClient$Result;

    move-result-object v0

    return-object v0
.end method

.method static createErrorResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/AuthorizationClient$Result;
    .registers 10
    .param p0, "request"    # Lcom/facebook/AuthorizationClient$AuthorizationRequest;
    .param p1, "errorType"    # Ljava/lang/String;
    .param p2, "errorDescription"    # Ljava/lang/String;
    .param p3, "errorCode"    # Ljava/lang/String;

    .prologue
    .line 1073
    const-string v0, ": "

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-static {v1}, Lcom/facebook/internal/Utility;->asListNoNulls([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v4

    .line 1074
    .local v4, "message":Ljava/lang/String;
    new-instance v0, Lcom/facebook/AuthorizationClient$Result;

    sget-object v2, Lcom/facebook/AuthorizationClient$Result$Code;->ERROR:Lcom/facebook/AuthorizationClient$Result$Code;

    const/4 v3, 0x0

    move-object v1, p0

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/facebook/AuthorizationClient$Result;-><init>(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Lcom/facebook/AuthorizationClient$Result$Code;Lcom/facebook/AccessToken;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method static createTokenResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Lcom/facebook/AccessToken;)Lcom/facebook/AuthorizationClient$Result;
    .registers 8
    .param p0, "request"    # Lcom/facebook/AuthorizationClient$AuthorizationRequest;
    .param p1, "token"    # Lcom/facebook/AccessToken;

    .prologue
    const/4 v4, 0x0

    .line 1060
    new-instance v0, Lcom/facebook/AuthorizationClient$Result;

    sget-object v2, Lcom/facebook/AuthorizationClient$Result$Code;->SUCCESS:Lcom/facebook/AuthorizationClient$Result$Code;

    move-object v1, p0

    move-object v3, p1

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/facebook/AuthorizationClient$Result;-><init>(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Lcom/facebook/AuthorizationClient$Result$Code;Lcom/facebook/AccessToken;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
