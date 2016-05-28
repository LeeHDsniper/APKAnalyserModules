.class public interface abstract Loauth/signpost/OAuthProviderListener;
.super Ljava/lang/Object;
.source "OAuthProviderListener.java"


# virtual methods
.method public abstract onResponseReceived(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpResponse;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract prepareRequest(Loauth/signpost/http/HttpRequest;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract prepareSubmission(Loauth/signpost/http/HttpRequest;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
