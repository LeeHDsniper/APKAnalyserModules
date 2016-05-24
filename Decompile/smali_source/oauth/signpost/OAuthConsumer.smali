.class public interface abstract Loauth/signpost/OAuthConsumer;
.super Ljava/lang/Object;
.source "OAuthConsumer.java"

# interfaces
.implements Ljava/io/Serializable;


# virtual methods
.method public abstract getConsumerKey()Ljava/lang/String;
.end method

.method public abstract getConsumerSecret()Ljava/lang/String;
.end method

.method public abstract getToken()Ljava/lang/String;
.end method

.method public abstract getTokenSecret()Ljava/lang/String;
.end method

.method public abstract setAdditionalParameters(Loauth/signpost/http/HttpParameters;)V
.end method

.method public abstract setTokenWithSecret(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract sign(Ljava/lang/Object;)Loauth/signpost/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Loauth/signpost/exception/OAuthMessageSignerException;,
            Loauth/signpost/exception/OAuthExpectationFailedException;,
            Loauth/signpost/exception/OAuthCommunicationException;
        }
    .end annotation
.end method

.method public abstract sign(Loauth/signpost/http/HttpRequest;)Loauth/signpost/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Loauth/signpost/exception/OAuthMessageSignerException;,
            Loauth/signpost/exception/OAuthExpectationFailedException;,
            Loauth/signpost/exception/OAuthCommunicationException;
        }
    .end annotation
.end method
