.class abstract Lcom/adobe/creativesdk/aviary/log/LoggerFactory$BaseLogger;
.super Ljava/lang/Object;
.source "LoggerFactory.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/log/LoggerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "BaseLogger"
.end annotation


# instance fields
.field tag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "basetag"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$BaseLogger;->tag:Ljava/lang/String;

    .line 66
    return-void
.end method
