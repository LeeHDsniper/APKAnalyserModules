.class public Lcom/facebook/FacebookDialogException;
.super Lcom/facebook/FacebookException;
.source "FacebookDialogException.java"


# static fields
.field static final serialVersionUID:J = 0x1L


# instance fields
.field private errorCode:I

.field private failingUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "errorCode"    # I
    .param p3, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    .line 32
    iput p2, p0, Lcom/facebook/FacebookDialogException;->errorCode:I

    .line 33
    iput-object p3, p0, Lcom/facebook/FacebookDialogException;->failingUrl:Ljava/lang/String;

    .line 34
    return-void
.end method
