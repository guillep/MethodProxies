Extension { #name : #BlockClosure }

{ #category : #'*MethodProxies' }
BlockClosure >> methodProxyEnsure: aBlock [
	"Evaluate a termination block after evaluating the receiver, regardless of
	 whether the receiver's evaluation completes.  N.B.  This method is *not*
	 implemented as a primitive.  Primitive 198 always fails.  The VM uses prim
	 198 in a context's method as the mark for an ensure:/ifCurtailed: activation."

	| complete returnValue |
	<primitive: 198>
	<methodProxyCannotWrap>
	returnValue := self valueNoContextSwitch.
	MpMethodProxyPool protect.
	complete ifNil:[
		complete := true.
		aBlock value.
	].
	^ returnValue
]
