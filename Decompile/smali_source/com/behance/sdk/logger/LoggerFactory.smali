.class public Lcom/behance/sdk/logger/LoggerFactory;
.super Ljava/lang/Object;
.source "LoggerFactory.java"


# direct methods
.method public static getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;
    .registers 2
    .param p0, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 29
    new-instance v0, Lcom/behance/sdk/logger/Logger;

    invoke-direct {v0, p0}, Lcom/behance/sdk/logger/Logger;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method
