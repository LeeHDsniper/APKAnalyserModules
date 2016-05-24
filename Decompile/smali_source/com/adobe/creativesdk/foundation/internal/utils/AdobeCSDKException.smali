.class public abstract Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
.super Ljava/lang/Exception;
.source "AdobeCSDKException.java"


# instance fields
.field protected _data:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/HashMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p1, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;->_data:Ljava/util/HashMap;

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/util/HashMap;Ljava/lang/Exception;)V
    .registers 3
    .param p2, "cause"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Exception;",
            ")V"
        }
    .end annotation

    .prologue
    .line 35
    .local p1, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    .line 36
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;->_data:Ljava/util/HashMap;

    .line 37
    return-void
.end method


# virtual methods
.method public getData()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;->_data:Ljava/util/HashMap;

    return-object v0
.end method
