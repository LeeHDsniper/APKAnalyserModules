.class public final Luk/co/senab/photoview/log/LogManager;
.super Ljava/lang/Object;
.source "LogManager.java"


# static fields
.field private static logger:Luk/co/senab/photoview/log/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    new-instance v0, Luk/co/senab/photoview/log/LoggerDefault;

    invoke-direct {v0}, Luk/co/senab/photoview/log/LoggerDefault;-><init>()V

    sput-object v0, Luk/co/senab/photoview/log/LogManager;->logger:Luk/co/senab/photoview/log/Logger;

    return-void
.end method

.method public static getLogger()Luk/co/senab/photoview/log/Logger;
    .registers 1

    .prologue
    .line 32
    sget-object v0, Luk/co/senab/photoview/log/LogManager;->logger:Luk/co/senab/photoview/log/Logger;

    return-object v0
.end method
